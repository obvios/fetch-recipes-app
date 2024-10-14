//
//  RecipesListViewModelTests.swift
//  FetchRecipesAppTests
//
//  Created by Eric Palma on 10/14/24.
//

import XCTest
@testable import FetchRecipesApp

final class RecipesListViewModelTests: XCTestCase {

    var viewModel: RecipesListViewModel!
    var mockUseCase: MockFetchRecipesUseCase!
    
    @MainActor
    override func setUp() {
        super.setUp()
        mockUseCase = MockFetchRecipesUseCase()
        viewModel = RecipesListViewModel(fetchRecipesUseCase: mockUseCase)
    }
    
    override func tearDown() {
        mockUseCase = nil
        viewModel = nil
        super.tearDown()
    }
    
    @MainActor
    func testLoadRecipes_withNonEmptyRecipes_shouldUpdateRecipes() async {
        // Arrange
        let recipe = Recipe(id: "1", name: "Test Recipe", cuisine: "Cuisine", largeImageUrl: "", smallImageUrl: "", sourceUrl: nil, youtubeUrl: nil)
        mockUseCase.recipesToReturn = [recipe]
        
        // Act
        await viewModel.loadRecipes()
        
        // Assert
        XCTAssertFalse(viewModel.isLoadingInitialData)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.recipes.count, 1)
        XCTAssertEqual(viewModel.recipes.first?.name, "Test Recipe")
    }
    
    @MainActor
    func testLoadRecipes_withFetchError_shouldSetErrorMessage() async {
        // Arrange
        mockUseCase.errorToThrow = FetchRecipesUseCaseError.emptyData
        
        // Act
        await viewModel.loadRecipes()
        
        // Assert
        XCTAssertFalse(viewModel.isLoadingInitialData)
        XCTAssertEqual(viewModel.errorMessage, "No recipes available.")
        XCTAssertEqual(viewModel.recipes.count, 0)
    }
    
    @MainActor
    func testLoadRecipes_withUnexpectedError_shouldSetGenericErrorMessage() async {
        // Arrange
        mockUseCase.errorToThrow = NSError(domain: "TestError", code: 1, userInfo: nil)
        
        // Act
        await viewModel.loadRecipes()
        
        // Assert
        XCTAssertFalse(viewModel.isLoadingInitialData)
        XCTAssertEqual(viewModel.errorMessage, "An unexpected error occurred. Please try again.")
        XCTAssertEqual(viewModel.recipes.count, 0)
    }

}
