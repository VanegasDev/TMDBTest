//
//  AuthenticationService.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation
import Combine

protocol AuthenticationServiceType {
    func createSession() -> AnyPublisher<SessionToken, Error>
}

protocol AuthenticationServiceDependenciesType {
    var apiRequester: NetworkRequesterType { get }
}

struct AuthenticationServiceDependencies: AuthenticationServiceDependenciesType {
    let apiRequester: NetworkRequesterType = NetworkRequester()
}

struct AuthenticationService: AuthenticationServiceType {
    
    private let dependencies: AuthenticationServiceDependenciesType
    
    init(dependencies: AuthenticationServiceDependenciesType = AuthenticationServiceDependencies()) {
        self.dependencies = dependencies
    }
    
    // Create Session
    func createSession() -> AnyPublisher<SessionToken, Error> {
        dependencies.apiRequester.request(AuthenticationTarget.createSession)
    }
}
