//
//  RecipeRepository.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

class RecipeRepository: RecipeRepositoryProtocol {
    private let apiClient: RecipeAPIClient
    
    init(apiClient: RecipeAPIClient) {
        self.apiClient = apiClient
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        do {
            let data = try await apiClient.fetchRecipeData()
            let decoder = JSONDecoder()
            let recipeDTOs = try decoder.decode([RecipeDTO].self, from: data)
            return recipeDTOs.map { Recipe(from: $0) }
        } catch let error as RecipeAPIError {
            // Pass along RecipeAPIError directly to the caller
            throw error
        } catch {
            // Catch any other errors as decoding issues
            throw RecipeRepositoryError.malformedData
        }
    }
}
