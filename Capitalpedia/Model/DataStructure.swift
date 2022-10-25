//
//  DataStructureCountries.swift
//  Capitalpedia
//
//  Created by Thomas Korsnes on 24/10/2022.
//

import Foundation


struct Country: Codable {
    let name: Name
    let independent: Bool?
    let unMember: Bool
    let capital: [String]?
    let languages: [String: String]?
    let region: String
    let flag: String
    /*
    enum Region: String, Codable {
        case africa = "Africa"
        case americas = "Americas"
        case antarctic = "Antarctic"
        case asia = "Asia"
        case europe = "Europe"
        case oceania = "Oceania"
    }
     */
}

struct Name: Codable, Hashable {
    let common, official: String
}



