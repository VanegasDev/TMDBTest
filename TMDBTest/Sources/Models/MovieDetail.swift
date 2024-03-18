//
//  MovieDetail.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 18/3/24.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let overview: String
    let backgroundImage: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case backgroundImage = "backdrop_path"
        case voteAverage = "vote_average"
    }
}
