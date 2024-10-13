//
//  DefaultRecipeRepository.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

class DefaultRecipeRepository: RecipeRepository {
    private let apiClient: RecipeAPIClient
    
    init(apiClient: RecipeAPIClient) {
        self.apiClient = apiClient
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        do {
            let data = try await apiClient.fetchRecipeData()
            let decoder = JSONDecoder()
            let recipesDTO = try decoder.decode(RecipesDTO.self, from: data)
            return recipesDTO.recipes.map { Recipe(from: $0) }
        } catch let error as RecipeAPIError {
            // Pass along RecipeAPIError directly to the caller
            throw error
        } catch {
            // Catch any other errors as decoding issues
            throw RecipeRepositoryError.malformedData
        }
    }
}
