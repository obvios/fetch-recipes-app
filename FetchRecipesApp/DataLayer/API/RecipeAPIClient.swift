//
//  RecipeAPIClient.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

enum RecipeAPIError: Error {
    case invalidResponse
    case networkError(Error)
}

protocol RecipeAPIClient {
    func fetchRecipeData() async throws -> Data
}
