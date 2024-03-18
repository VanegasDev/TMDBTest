//
//  MovieDetailView.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 17/3/24.
//

import SwiftUI
import AVKit
import WebKit

struct MovieDetailView: View {
    
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        ZStack {
            Color.backgroundSwiftUIColor
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    movieHeader
                    
                    VStack(alignment: .leading, spacing: 16) {
                        summary
                        
                        Spacer()
                            .frame(height: 16)
                        
                        videos
                        
                        Spacer()
                            .frame(height: 16)
                        
                        crewList
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                    
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .onAppear {
            viewModel.fetchMovieInformation()
        }
    }
    
    @ViewBuilder
    private var movieHeader: some View {
        AsyncImage(url: URL(string: Constants.imageBasePath + (viewModel.movieDetail?.backgroundImage ?? ""))) { image in
            image
                .resizable()
        } placeholder: {
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
        .frame(height: 200)
        
        HStack {
            Spacer()
            Text(String(format: "%.1f", viewModel.movieDetail?.voteAverage ?? 0))
                .padding()
                .background(Color.tertiaryFixed)
                .clipShape(Circle())
                .offset(y: -25)
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private var summary: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Summary")
                    .font(.title2)
                    .foregroundStyle(Color.tertiaryFixed)
                    .bold()
                Text(viewModel.movieDetail?.title ?? "-")
                    .font(.title)
                    .foregroundStyle(Color.defaultAccent)
                    .bold()
            }
            
            Spacer()
            
            Image(systemName: "heart")
                .foregroundStyle(Color.tertiaryFixed)
                .font(.title)
        }
        
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Overview")
                .font(.headline)
                .foregroundStyle(Color.tmdbPlaceholder)
                .bold()
            Text(viewModel.movieDetail?.overview ?? "-")
                .font(.body)
                .foregroundStyle(Color.defaultAccent)
        }
    }
    
    @ViewBuilder
    private var videos: some View {
        VStack(alignment: .leading, spacing:16) {
            Text("Trailer")
                .font(.title2)
                .foregroundStyle(Color.tertiaryFixed)
                .bold()
            
            GeometryReader { proxy in
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.movieVideos) { video in
                            YouTubeView(videoId: video.key)
                                .frame(width: proxy.size.width, height: 200)
                        }
                    }
                }
            }
            .frame(height: 200)
        }
    }
    
    @ViewBuilder
    private var crewList: some View {
        VStack(alignment: .leading, spacing:16) {
            Text("Crew")
                .font(.title2)
                .foregroundStyle(Color.tertiaryFixed)
                .bold()
            
            GeometryReader { proxy in
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.crewList) { crew in
                            CrewView(crew: crew)
                                .frame(width: 150, height: 150)
                        }
                    }
                }
            }
            .frame(height: 200)
        }
    }
}

#Preview {
    MovieDetailView(viewModel: MovieDetailViewModel(movieId: 1011985))
}
