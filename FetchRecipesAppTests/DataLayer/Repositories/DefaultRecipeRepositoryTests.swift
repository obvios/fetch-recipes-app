//
//  DefaultRecipeRepositoryTests.swift
//  FetchRecipesAppTests
//
//  Created by Eric Palma on 10/13/24.
//

import XCTest
@testable import FetchRecipesApp

final class DefaultRecipeRepositoryTests: XCTestCase {

    var repository: DefaultRecipeRepository!
    var mockApiClient: MockRecipeAPIClient!
    
    override func setUp() {
        super.setUp()
        mockApiClient = MockRecipeAPIClient()
        repository = DefaultRecipeRepository(apiClient: mockApiClient)
    }
    
    override func tearDown() {
        mockApiClient = nil
        repository = nil
        super.tearDown()
    }
    
    func testFetchRecipes_withValidData_shouldReturnRecipes() async throws {
        // Arrange
        let recipeDTO = RecipeDTO(cuisine: "Cuisine",
                                  name: "Test Recipe",
                                  photo_url_large: "Cuisine",
                                  photo_url_small: "https://example.com/large.jpg",
                                  source_url: "https://example.com/small.jpg",
                                  uuid: "123",
                                  youtube_url: nil)
        let recipesDTO = RecipesDTO(recipes: [recipeDTO])
        let validData = try JSONEncoder().encode(recipesDTO)
        mockApiClient.dataToReturn = validData
        
        // Act
        let recipes = try await repository.fetchRecipes()
        
        // Assert
        XCTAssertEqual(recipes.count, 1)
        XCTAssertEqual(recipes.first?.name, "Test Recipe")
        XCTAssertEqual(recipes.first?.cuisine, "Cuisine")
    }
    
    func testFetchRecipes_withEmptyData_shouldReturnEmptyRecipesArray() async throws {
        // Arrange
        let recipesDTO = RecipesDTO(recipes: [])
        let emptyData = try JSONEncoder().encode(recipesDTO)
        mockApiClient.dataToReturn = emptyData
        
        // Act
        let recipes = try await repository.fetchRecipes()
        
        // Assert
        XCTAssertEqual(recipes.count, 0)
    }
    
    func testFetchRecipes_withInvalidResponseError_shouldThrowRecipeAPIError() async {
        // Arrange
        mockApiClient.errorToThrow = RecipeAPIError.invalidResponse
        
        // Act & Assert
        do {
            _ = try await repository.fetchRecipes()
            XCTFail("Expected to throw RecipeAPIError.invalidResponse")
        } catch let error as RecipeAPIError {
            XCTAssertEqual(error, .invalidResponse)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testFetchRecipes_withDecodingError_shouldThrowMalformedDataError() async {
        // Arrange
        mockApiClient.dataToReturn = Data("Invalid JSON".utf8) // Malformed JSON
        
        // Act & Assert
        do {
            _ = try await repository.fetchRecipes()
            XCTFail("Expected to throw RecipeRepositoryError.malformedData")
        } catch let error as RecipeRepositoryError {
            XCTAssertEqual(error, .malformedData)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

}
