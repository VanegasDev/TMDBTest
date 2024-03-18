//
//  MovieVideos.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 18/3/24.
//

import Foundation

struct MovieVideosResponse: Decodable {
    let id: Int
    let results: [MovieVideo]
}

struct MovieVideo: Decodable, Identifiable {
    let key: String
    let site: String
    let official: Bool
    
    var id: String {
        key
    }
}
