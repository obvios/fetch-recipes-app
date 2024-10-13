//
//  RecipeAPIClient.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

enum RecipeAPIError: Error, Equatable {
    case invalidResponse
    case networkError(Error)
    
    static func == (lhs: RecipeAPIError, rhs: RecipeAPIError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidResponse, .invalidResponse):
            return true
        case (.networkError, .networkError):
            // Only check that both are `networkError`, ignoring associated `Error` values
            return true
        default:
            return false
        }
    }
}

protocol RecipeAPIClient {
    func fetchRecipeData() async throws -> Data
}
