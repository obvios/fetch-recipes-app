//
//  RecipeRowView.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/12/24.
//

import SwiftUI
import Kingfisher

struct RecipeRowView: View {
    let recipe: Recipe

    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: recipe.smallImageUrl))
                .placeholder {
                    ProgressView($0)
                }
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 5)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
    }
}

#Preview {
    RecipeRowView(recipe: Recipe(from: .init(cuisine: "British",
                                             name: "Apple Frangipan Tart",
                                             photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                                             photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                                             source_url: "test",
                                             uuid: "test1",
                                             youtube_url: "test")))
}
