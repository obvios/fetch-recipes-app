//
//  FetchRecipesUseCaseImpl.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

class FetchRecipesUseCaseImpl: FetchRecipesUseCase {
    private let repository: RecipeRepositoryProtocol
    
    init(repository: RecipeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Recipe] {
        // Fetch recipes from the repository
        let recipes = try await repository.fetchRecipes()
        
        // Check if the list is empty, throw an empty data error if necessary
        guard !recipes.isEmpty else {
            throw FetchRecipesUseCaseError.emptyData
        }
        
        return recipes
    }
}
