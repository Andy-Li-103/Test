//
//  RecipeRepo.swift
//  Test
//
//  Created by Andy Li on 1/10/24.
//

import Foundation

enum Errors: Error {
    case URL
    case Decode
}

struct RecipeRepo {
    
    static func getRecipes() async throws -> CategoryRecipeResponse {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            throw Errors.URL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CategoryRecipeResponse.self, from: data)
    }
    
    static func getRecipeDetail(id: String) async throws -> DetailRecipeResponse {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            throw Errors.URL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(DetailRecipeResponse.self, from: data)
    }
  
}
