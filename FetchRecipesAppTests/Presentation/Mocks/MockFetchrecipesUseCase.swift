//
//  MockFetchrecipesUseCase.swift
//  FetchRecipesAppTests
//
//  Created by Eric Palma on 10/14/24.
//

import Foundation
@testable import FetchRecipesApp

class MockFetchRecipesUseCase: FetchRecipesUseCase {
    var recipesToReturn: [Recipe] = []
    var errorToThrow: Error?

    func execute() async throws -> [Recipe] {
        if let error = errorToThrow {
            throw error
        }
        return recipesToReturn
    }
}
