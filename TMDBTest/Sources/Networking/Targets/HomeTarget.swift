//
//  HomeTarget.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation

enum HomeTarget {
    case nowPlaying(page: Int)
    case popular(page: Int)
    case topRated(page: Int)
    case upcoming(page: Int)
}

extension HomeTarget: TargetType {
    var path: String {
        switch self {
        case .nowPlaying(let page):
            return "/movie/now_playing?page=\(page)"
        case .popular(let page):
            return "/movie/popular?page=\(page)"
        case .topRated(let page):
            return "/movie/top_rated?page=\(page)"
        case .upcoming(let page):
            return "/movie/upcoming?page=\(page)"
        }
    }
    
    var method: TMDBRequestMethod {
        .get
    }
}
