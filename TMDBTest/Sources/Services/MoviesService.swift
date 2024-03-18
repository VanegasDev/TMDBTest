//
//  MoviesService.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 18/3/24.
//

import Foundation
import Combine

protocol MoviesServiceType {
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetail, Error>
    func fetchMovieVideos(id: Int) -> AnyPublisher<MovieVideosResponse, Error>
    func fetchCrew(id: Int) -> AnyPublisher<CrewResponse, Error>
}

protocol MoviesServiceDependenciesType {
    var networkService: NetworkRequesterType { get }
}

struct MoviesServiceDependencies: MoviesServiceDependenciesType {
    var networkService: NetworkRequesterType = NetworkRequester()
}

struct MoviesService: MoviesServiceType {
    private let dependencies: MoviesServiceDependenciesType
    
    init(dependencies: MoviesServiceDependenciesType = MoviesServiceDependencies()) {
        self.dependencies = dependencies
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetail, Error> {
        dependencies.networkService.request(MoviesTarget.movieDetail(id: id))
    }
    
    func fetchMovieVideos(id: Int) -> AnyPublisher<MovieVideosResponse, Error> {
        dependencies.networkService.request(MoviesTarget.trailers(id: id))
    }
    
    func fetchCrew(id: Int) -> AnyPublisher<CrewResponse, Error> {
        dependencies.networkService.request(MoviesTarget.crew(id: id))
    }
}
