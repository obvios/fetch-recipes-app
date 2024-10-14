//
//  RecipesListViewModel.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

@MainActor
class RecipesListViewModel: ObservableObject {
    // MARK: - Published Properties (UI States)
    @Published var recipes: [Recipe] = []
    @Published var isLoadingInitialData: Bool = false
    @Published var errorMessage: String? = nil
    
    private let fetchRecipesUseCase: FetchRecipesUseCase
    
    // MARK: - Initializer
    init(fetchRecipesUseCase: FetchRecipesUseCase) {
        self.fetchRecipesUseCase = fetchRecipesUseCase
        // Requests recipes once during app startup.
        Task {
            isLoadingInitialData = true
            await loadRecipes()
            isLoadingInitialData = false
        }
    }
    
    // MARK: - Methods
    func loadRecipes() async {
        do {
            errorMessage = nil
            
            let recipes = try await fetchRecipesUseCase.execute()
            self.recipes = recipes
        } catch FetchRecipesUseCaseError.emptyData {
            errorMessage = "No recipes available."
        } catch {
            // Handle any other unexpected errors
            errorMessage = "An unexpected error occurred. Please try again."
        }
    }
}
