//
//  FetchRecipesUseCase.swift
//  FetchRecipesApp
//
//  Created by Eric Palma on 10/11/24.
//

import Foundation

enum FetchRecipesUseCaseError: Error {
    case emptyData
}

protocol FetchRecipesUseCase {
    func execute() async throws -> [Recipe]
}
