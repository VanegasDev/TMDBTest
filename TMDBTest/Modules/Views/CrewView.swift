//
//  CrewView.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 18/3/24.
//

import SwiftUI

struct CrewView: View {
    let crew: Crew
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: Constants.imageBasePath + (crew.profilePicture ?? ""))) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            } placeholder: {
                Image(systemName: "person.fill")
            }
            .frame(height: 150)
            .clipShape(Circle())
            
            Text(crew.name)
        }
    }
}
