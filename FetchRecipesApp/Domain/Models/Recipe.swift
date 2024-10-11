//
//  Recipe.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

struct Recipe: Identifiable {
    let id: String
    let name: String
    let cuisine: String
    let largeImageUrl: String
    let smallImageUrl: String
    let sourceUrl: URL?
    let youtubeUrl: URL?

    // Initializer to map from DTO
    init(from dto: RecipeDTO) {
        self.id = dto.uuid
        self.name = dto.name
        self.cuisine = dto.cuisine
        self.largeImageUrl = dto.photo_url_large
        self.smallImageUrl = dto.photo_url_small
        self.sourceUrl = URL(string: dto.source_url)
        self.youtubeUrl = URL(string: dto.youtube_url)
    }
}
