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
    let region: Region
    let flag: String
    let population: Int
    let coatOfArms: CoatOfArms
}

struct Name: Codable, Hashable {
    let common, official: String
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

struct CoatOfArms: Codable {
    let png: String?
}

extension Name: Comparable {
    static func < (lhs: Name, rhs: Name) -> Bool {
        return lhs.common < rhs.common
    }
}




