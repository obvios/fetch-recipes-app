//
//  DefaultFetchRecipesUseCase.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

class DefaultFetchRecipesUseCase: FetchRecipesUseCase {
    private let repository: RecipeRepository
    
    init(repository: RecipeRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Recipe] {
        let recipes = try await repository.fetchRecipes()
        
        guard !recipes.isEmpty else {
            throw FetchRecipesUseCaseError.emptyData
        }
        
        return recipes
    }
}
