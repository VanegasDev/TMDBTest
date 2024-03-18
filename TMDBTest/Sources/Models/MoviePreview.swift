//
//  MoviePreview.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation

struct MoviePreview: Decodable, Identifiable {
    let id: Int
    let title: String?
    let releaseDate: String?
    let imagePath: String?
    let voteAverage: Double?
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case imagePath = "poster_path"
        case voteAverage = "vote_average"
        case overview
    }
}
