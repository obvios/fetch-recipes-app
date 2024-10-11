//
//  RecipeAPIClient.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

protocol RecipeAPIClient {
    func fetchRecipeData() async throws -> Data
}
