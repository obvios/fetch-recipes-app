//
//  MockRecipeRepository.swift
//  FetchRecipesAppTests
//
//  Created by Eric Palma on 10/13/24.
//

import Foundation
@testable import FetchRecipesApp

class MockRecipeRepository: RecipeRepository {
    var recipesToReturn: [Recipe] = []
    var errorToThrow: Error?

    func fetchRecipes() async throws -> [Recipe] {
        if let error = errorToThrow {
            throw error
        }
        return recipesToReturn
    }
}
