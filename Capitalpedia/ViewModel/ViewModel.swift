//
//  viewModel.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import Foundation
import CoreLocation

@MainActor
class ViewModel: ObservableObject {
    
    private let dataService = DataService()
    
    @Published var countries: [Country] = []
    @Published var sortingSelection: SortingType = .alphabetically
    
    init() {
        fetchAllCountries()
    }
    
    @MainActor
    func fetchAllCountries() {
        Task {
            do {
                countries = try await dataService.fetchAllCountries()
            } catch {
                print(error)
                countries = []
            }
        }
    }
    
    @MainActor
    func countriesSorted() -> [Country] {
        switch sortingSelection {
        case .alphabetically:
            return countries.sorted { $0.name < $1.name }
        case .populationSize:
            return countries.sorted { $0.population > $1.population }
        default:
            return countries.filter { $0.region.rawValue == sortingSelection.rawValue }.sorted { $0.name < $1.name }
        }
    }
}

enum SortingType: String, CaseIterable {
    case alphabetically = "Alphabetically"
    case populationSize = "Population size"
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}
