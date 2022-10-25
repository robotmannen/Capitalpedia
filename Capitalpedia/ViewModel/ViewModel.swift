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
        case .reigionally:
            return countries.sorted { $0.region < $1.region }
        case .all:
            return countries
        }
    }
    
    enum SortingType {
        case alphabetically, reigionally, all
    }
}
