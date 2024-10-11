//
//  RecipeDTO.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

struct RecipeDTO: Codable {
    let cuisine: String
    let name: String
    let photo_url_large: String
    let photo_url_small: String
    let source_url: String
    let uuid: String
    let youtube_url: String
}
