//
//  MockRecipeAPIClient.swift
//  FetchRecipesAppTests
//
//  Created by Eric Palma on 10/13/24.
//

import Foundation
@testable import FetchRecipesApp

class MockRecipeAPIClient: RecipeAPIClient {
    var dataToReturn: Data?
    var errorToThrow: Error?

    func fetchRecipeData() async throws -> Data {
        if let error = errorToThrow {
            throw error
        }
        guard let data = dataToReturn else {
            throw RecipeAPIError.invalidResponse
        }
        return data
    }
}
