//
//  MoviesTarget.swift
//  TMDBTest
//
//  Created by Mario Vanegas
//

import Foundation

enum MoviesTarget {
    case movieDetail(id: Int)
    case trailers(id: Int)
    case crew(id: Int)
}

extension MoviesTarget: TargetType {
    var path: String {
        switch self {
        case .movieDetail(let id):
            return "/movie/\(id)"
        case .trailers(let id):
            return "/movie/\(id)/videos"
            case .crew(let id):
                return "/movie/\(id)/credits"
        }
    }
    
    var method: TMDBRequestMethod {
        .get
    }
}
