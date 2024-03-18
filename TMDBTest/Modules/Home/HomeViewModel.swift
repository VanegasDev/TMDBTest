//
//  HomeViewModel.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation
import Combine

enum HomeDisplayType: String, CaseIterable {
    case nowPlaying = "Now Playing"
    case popular = "Popular"
    case topRated = "Top Rated"
    case upcoming = "Upcoming"
}

protocol HomeViewModelDependenciesType {
    var homeService: HomeServiceType { get }
}

struct HomeViewModelDependencies: HomeViewModelDependenciesType {
    let homeService: HomeServiceType = HomeService()
}

class HomeViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var nowPlaying: [MoviePreview] = []
    @Published var homeDisplayType: HomeDisplayType = .nowPlaying
    @Published var isFinished = false
    @Published var currentPage = 0
    @Published var movieDetailId: Int?
    
    private let dependencies: HomeViewModelDependenciesType
    
    private var cancellables: Set<AnyCancellable> = []
    private var nextPage: Int {
        currentPage + 1
    }
    
    init(dependencies: HomeViewModelDependenciesType = HomeViewModelDependencies()) {
        self.dependencies = dependencies
    }
    
    func fetchNowPlaying() {
        dependencies.homeService
            .fetchHomeMovies(homeDisplayType, on: nextPage)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveRequest: { [weak self] _ in
                self?.isLoading = true
            })
            .sink { [weak self] completion in
                self?.isLoading = false
                
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.nowPlaying += response.results
                self?.isFinished = response.page == response.totalPages
                self?.currentPage = response.page
            }
            .store(in: &cancellables)
    }
}
