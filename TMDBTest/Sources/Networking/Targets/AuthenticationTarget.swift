//
//  AuthenticationTarget.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation

enum AuthenticationTarget {
    case createSession
}

// MARK: Moya Target Implemetation
extension AuthenticationTarget: TargetType {    
    var path: String {
        switch self {
        case .createSession:
            return "/authentication/guest_session/new"
        }
    }
    
    var method: TMDBRequestMethod {
        switch self {
        case .createSession:
            return .get
        }
    }
}
