//
//  RecipesListView.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/13/24.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject private var viewModel: RecipesListViewModel
        
    init(viewModel: RecipesListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading recipes...")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                List(viewModel.recipes) { recipe in
                    RecipeRowView(recipe: recipe)
                }
                .listStyle(PlainListStyle())
                .refreshable {
                    await viewModel.loadRecipes()
                }
            }
        }
        .navigationTitle("Recipes")
        .onAppear {
            Task {
                await viewModel.loadRecipes()
            }
        }
    }
}
