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
    @Published var sortBy: SortingType = .alphabetically
    
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
    func sortCountries() -> [Country] {
        switch sortBy {
        case .alphabetically:
            return countries.sorted { $0.name < $1.name }
        case .africa:
            return countries.filter { $0.region.rawValue == "Africa" }.sorted { $0.name < $1.name }
        case .americas:
            return countries.filter { $0.region.rawValue == "Americas"}.sorted { $0.name < $1.name }
        case .antarctic:
            return countries.filter { $0.region.rawValue == "Antarctic"}.sorted { $0.name < $1.name }
        case .asia:
            return countries.filter { $0.region.rawValue == "Asia"}.sorted { $0.name < $1.name }
        case .europe:
            return countries.filter { $0.region.rawValue == "Europe"}.sorted { $0.name < $1.name }
        case .oceania:
            return countries.filter { $0.region.rawValue == "Oceania"}.sorted { $0.name < $1.name }
        case .populationSize:
            return countries.sorted { $0.population > $1.population }
        }
    }
    
    enum SortingType {
        case alphabetically
        case populationSize
        case africa
        case americas
        case antarctic
        case asia
        case europe
        case oceania
    }
}
