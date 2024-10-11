//
//  RecipeAPIClientImpl.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

class RecipeAPIClientImpl: RecipeAPIClient {
    private let baseURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/")!

    func fetchRecipeData() async throws -> Data {
        do {
            let endpoint = baseURL.appendingPathComponent("recipes.json")
            let urlRequest = URLRequest(url: endpoint)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            // Check for HTTP response status
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw RecipeAPIError.invalidResponse
            }
            
            return data
        } catch {
            throw RecipeAPIError.networkError(error)
        }
    }
}
