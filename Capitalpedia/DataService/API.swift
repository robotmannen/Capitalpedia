//
//  API.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import Foundation

enum NetworkError: Error {
    case misformatUrl
    case dataLoadFailed
}

struct DataService {
    
    private static let host = "https://restcountries.com/v3.1/"
    
    private func performRequest(_ url: String) async throws -> [Country] {
        if let url = URL(string: url) {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("hei")
            let countriesData: [Country]? = try JSONDecoder().decode([Country].self, from: data)
            if let json = countriesData {
                return json
            }
            
            throw NetworkError.dataLoadFailed
        }
        
        throw NetworkError.misformatUrl
    }
    
    func fetchAllCountries() async throws -> [Country] {
        let urlString = DataService.host + "/all"
        return try await performRequest(urlString)
    }
}
