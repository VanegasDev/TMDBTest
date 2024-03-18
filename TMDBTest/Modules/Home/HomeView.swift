//
//  HomeView.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    private let columns = [
        GridItem(.flexible(minimum: 16)),
        GridItem(.flexible(minimum: 16)),
    ]
    
    var body: some View {
        ZStack {
            Color.backgroundSwiftUIColor
                .ignoresSafeArea(.all)
            
            VStack {
                Picker("Sort by", selection: $viewModel.homeDisplayType) {
                    ForEach(HomeDisplayType.allCases, id: \.self) { sortType in
                        Text(sortType.rawValue)
                            .tag(sortType)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(viewModel.nowPlaying) { item in
                            MoviePreviewView(movie: item)
                                .frame(height: 350)
                                .onTapGesture {
                                    viewModel.movieDetailId = item.id
                                }
                        }
                    }
                    
                    LazyVStack {
                        if !viewModel.isFinished {
                            ProgressView()
                                .onAppear {
                                    viewModel.fetchNowPlaying()
                                }
                        }
                    }
                }
            }
            .padding()
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationTitle("Movies")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $viewModel.movieDetailId) { id in
            MovieDetailView(viewModel: MovieDetailViewModel(movieId: id))
        }
        .onChange(of: viewModel.homeDisplayType) {
            viewModel.fetchNowPlaying()
        }
    }
}

#Preview {
    HomeView()
}
