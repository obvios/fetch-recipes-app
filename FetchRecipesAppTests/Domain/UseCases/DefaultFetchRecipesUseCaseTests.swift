//
//  DefaultFetchRecipesUseCaseTests.swift
//  FetchRecipesAppTests
//
//  Created by Eric Palma on 10/13/24.
//

import XCTest
@testable import FetchRecipesApp

final class DefaultFetchRecipesUseCaseTests: XCTestCase {
    var useCase: DefaultFetchRecipesUseCase!
    var mockRepository: MockRecipeRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockRecipeRepository()
        useCase = DefaultFetchRecipesUseCase(repository: mockRepository)
    }
    
    override func tearDown() {
        mockRepository = nil
        useCase = nil
        super.tearDown()
    }
    
    func testExecute_withNonEmptyRecipes_shouldReturnRecipes() async throws {
        // Arrange
        let recipe = Recipe(id: "1", name: "Test Recipe", cuisine: "Test Cuisine", largeImageUrl: "", smallImageUrl: "", sourceUrl: nil, youtubeUrl: nil)
        mockRepository.recipesToReturn = [recipe]
        
        // Act
        let recipes = try await useCase.execute()
        
        // Assert
        XCTAssertEqual(recipes.count, 1)
        XCTAssertEqual(recipes.first?.name, "Test Recipe")
    }
    
    func testExecute_withEmptyRecipes_shouldThrowEmptyDataError() async {
        // Arrange
        mockRepository.recipesToReturn = []
        
        // Act & Assert
        do {
            _ = try await useCase.execute()
            XCTFail("Expected to throw FetchRecipesUseCaseError.emptyData")
        } catch let error as FetchRecipesUseCaseError {
            XCTAssertEqual(error, .emptyData)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testExecute_withRepositoryError_shouldPropagateError() async {
        // Arrange
        let expectedError = NSError(domain: "TestError", code: 1, userInfo: nil)
        mockRepository.errorToThrow = expectedError
        
        // Act & Assert
        do {
            _ = try await useCase.execute()
            XCTFail("Expected to throw an error from repository")
        } catch let error as NSError {
            XCTAssertEqual(error.domain, "TestError")
            XCTAssertEqual(error.code, 1)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

}
