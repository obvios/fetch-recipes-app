//
//  RecipeRepositoryProtocol.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

enum RecipeRepositoryError: Error {
    case malformedData
}

protocol RecipeRepository {
    func fetchRecipes() async throws -> [Recipe]
}
