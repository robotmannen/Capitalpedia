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
}

struct Name: Codable, Hashable {
    let common, official: String
}

extension Name: Comparable {
    static func < (lhs: Name, rhs: Name) -> Bool {
        return lhs.common < rhs.common
    }
}




