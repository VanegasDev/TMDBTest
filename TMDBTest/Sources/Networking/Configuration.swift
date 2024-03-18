//
//  Configuration.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation

// Configuration to use networking in the app

enum TMDBRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: TMDBRequestMethod { get }
    var headers: [String: String]? { get }
}

extension TargetType {
    var baseURL: String {
        Constants.baseUrl
    }
    
    var headers: [String: String]? {
        [
            "Authorization": "Bearer \(Constants.apiKey)",
            "accept": "application/json"
        ]
    }
}
