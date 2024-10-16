//
//  FetchRecipesApp.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import SwiftUI

@main
struct FetchRecipesApp: App {
    var body: some Scene {
        WindowGroup {
            // Initialize dependencies and inject them into the view
            let apiClient = DefaultRecipeAPIClient()
            let repository = DefaultRecipeRepository(apiClient: apiClient)
            let fetchRecipesUseCase = DefaultFetchRecipesUseCase(repository: repository)
            let viewModel = RecipesListViewModel(fetchRecipesUseCase: fetchRecipesUseCase)
            
            RecipesListView(viewModel: viewModel)
        }
    }
}
