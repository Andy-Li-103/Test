//
//  RecipeViewModel.swift
//  Test
//
//  Created by Andy Li on 1/10/24.
//

import Foundation

//extension RecipeListView {
    @Observable
    class RecipeViewModel {
        var BasicRecipes = [BasicRecipe]()
        var DetailRecipe: DetailRecipe?
        
        
        func fetchRecipes() async throws {
            BasicRecipes = try await RecipeRepo.getRecipes().meals
        }
        
        func fetchRecipeDetail(id: String) async throws {
            DetailRecipe = try await RecipeRepo.getRecipeDetail(id: id).meals[0]
        }
    }
//}
