//
//  MoviePreviewView.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import SwiftUI

struct MoviePreviewView: View {
    var movie: MoviePreview
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: Constants.imageBasePath + (movie.imagePath ?? ""))) { image in
                image
                    .resizable()
                    .aspectRatio(163/180, contentMode: .fit)
            } placeholder: {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            .frame(height: 180)
            
            Text(movie.title ?? "")
                .font(.body)
                .bold()
            
            HStack {
                Text(movie.releaseDate ?? "")
                    .font(.caption)
                Spacer()
                Image(systemName: "star.fill")
                Text(String(movie.voteAverage ?? 0))
                    .font(.caption)
            }
            
            Text(movie.overview ?? "")
                .font(.caption)
        }
        .padding()
        .foregroundStyle(Color.tertiaryFixed)
        .background(Color.primarySolidSwiftUIColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    MoviePreviewView(movie: MoviePreview(id: 1, title: "Title", releaseDate: nil, imagePath: "nil", voteAverage: 2, overview: "Hello"))
}
