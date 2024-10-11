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
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let fetchRecipesUseCase: FetchRecipesUseCase
    
    // MARK: - Initializer
    init(fetchRecipesUseCase: FetchRecipesUseCase) {
        self.fetchRecipesUseCase = fetchRecipesUseCase
    }
    
    // MARK: - Methods
    func loadRecipes() async {
        do {
            isLoading = true
            errorMessage = nil
            
            let recipes = try await fetchRecipesUseCase.execute()
            // Check if data is empty, update UI state accordingly
            if recipes.isEmpty {
                errorMessage = "No recipes available."
            } else {
                self.recipes = recipes
            }
            isLoading = false
        } catch FetchRecipesUseCaseError.emptyData {
            errorMessage = "No recipes available."
            isLoading = false
        } catch {
            // Handle any other unexpected errors
            errorMessage = "An unexpected error occurred. Please try again."
            isLoading = false
        }
    }
}
