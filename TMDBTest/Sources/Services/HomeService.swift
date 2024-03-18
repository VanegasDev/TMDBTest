//
//  HomeService.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation
import Combine

protocol HomeServiceType {
    func fetchHomeMovies(_ display: HomeDisplayType, on page: Int) -> AnyPublisher<APIResponse<[MoviePreview]>, Error>
}

protocol HomeServiceDependenciesType {
    var apiRequester: NetworkRequesterType { get }
}

struct HomeServiceDependencies: HomeServiceDependenciesType {
    let apiRequester: NetworkRequesterType = NetworkRequester()
}

struct HomeService: HomeServiceType {
    
    private let dependencies: HomeServiceDependenciesType
    
    init(dependencies: HomeServiceDependenciesType = HomeServiceDependencies()) {
        self.dependencies = dependencies
    }
    
    // Fetch Now Playing
    func fetchHomeMovies(_ display: HomeDisplayType, on page: Int) -> AnyPublisher<APIResponse<[MoviePreview]>, Error> {
        switch display {
        case .nowPlaying:
            dependencies.apiRequester.request(HomeTarget.nowPlaying(page: page))
        case .popular:
            dependencies.apiRequester.request(HomeTarget.popular(page: page))
        case .topRated:
            dependencies.apiRequester.request(HomeTarget.topRated(page: page))
        case .upcoming:
            dependencies.apiRequester.request(HomeTarget.upcoming(page: page))
        }
    }
}
