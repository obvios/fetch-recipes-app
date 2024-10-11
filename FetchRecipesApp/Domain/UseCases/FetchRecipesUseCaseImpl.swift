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
        let recipes = try await repository.fetchRecipes()
        
        guard !recipes.isEmpty else {
            throw FetchRecipesUseCaseError.emptyData
        }
        
        return recipes
    }
}
