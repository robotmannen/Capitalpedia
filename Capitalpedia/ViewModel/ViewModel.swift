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
    @Published var sortBy: SortingType = .all
    
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
        case .all:
            return countries
        case .africa:
            return countries.filter { $0.region.rawValue == "Africa"}
        case .americas:
            return countries.filter { $0.region.rawValue == "Americas"}
        case .antarctic:
            return countries.filter { $0.region.rawValue == "Antarctic"}
        case .asia:
            return countries.filter { $0.region.rawValue == "Asia"}
        case .europe:
            return countries.filter { $0.region.rawValue == "Europe"}
        case .oceania:
            return countries.filter { $0.region.rawValue == "Oceania"}
        }
    }
    
    enum SortingType {
        case alphabetically
        case all
        case africa
        case americas
        case antarctic
        case asia
        case europe
        case oceania
        
    }
}
