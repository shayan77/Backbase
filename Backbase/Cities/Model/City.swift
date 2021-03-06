//
//  City.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import Foundation

struct City: Codable, Equatable {
    let country: String?
    let name: String?
    let id: Int?
    let coordinate: Coordinate?
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case name = "name"
        case id = "_id"
        case coordinate = "coord"
    }
    
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Coordinate: Codable {
    let longitude: Double?
    let latitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
