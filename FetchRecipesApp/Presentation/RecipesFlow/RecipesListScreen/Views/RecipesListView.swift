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
            Text("Recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            if viewModel.isLoadingInitialData {
                // Custom progress view only for initial load.
                // Subsequent refreshes use built in `refreshable` capability to show progress
                ProgressView("Loading recipes...")
                    .padding()
                Spacer()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
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
        .task {
            await viewModel.loadIinitialData()
        }
    }
}
