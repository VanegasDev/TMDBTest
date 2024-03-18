//
//  Crew.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 18/3/24.
//

import Foundation

struct CrewResponse: Decodable {
    let cast: [Crew]
}

struct Crew: Decodable, Identifiable {
    let id: Int
    let name: String
    let profilePicture: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePicture = "profile_path"
    }
}
