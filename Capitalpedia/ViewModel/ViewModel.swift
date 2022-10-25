//
//  viewModel.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    
    private let dataService = DataService()
    
    @Published var countries: [Country]? = nil
    
    init() {
        fetchCountries()
    }
    
    @MainActor
    func fetchCountries() {
        Task {
            do {
                countries = try await dataService.fetchAllCountries()
            } catch {
                print(error)
                countries = nil
            }
        }
    }
}
