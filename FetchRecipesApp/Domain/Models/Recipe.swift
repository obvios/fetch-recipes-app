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

    init(id: String, name: String, cuisine: String, largeImageUrl: String, smallImageUrl: String, sourceUrl: URL?, youtubeUrl: URL?) {
        self.id = id
        self.name = name
        self.cuisine = cuisine
        self.largeImageUrl = largeImageUrl
        self.smallImageUrl = smallImageUrl
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
    }
    
    // Initializer to map from DTO
    init(from dto: RecipeDTO) {
        self.id = dto.uuid
        self.name = dto.name
        self.cuisine = dto.cuisine
        self.largeImageUrl = dto.photo_url_large
        self.smallImageUrl = dto.photo_url_small
        self.sourceUrl = dto.source_url.flatMap { URL(string: $0) }
        self.youtubeUrl = dto.youtube_url.flatMap { URL(string: $0) }
    }
}
