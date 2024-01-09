//
//  ContentView.swift
//  Test
//
//  Created by Andy Li on 1/8/24.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(RecipeViewModel.self) var model
    var category = "Dessert"
    var body: some View {
        VStack{
            if model.BasicRecipes.isEmpty {
              ProgressView()
            } else {
                NavigationStack {
                    List(model.BasicRecipes, id: \.idMeal) { BasicRecipe in
                        NavigationLink(BasicRecipe.strMeal, value: BasicRecipe)
                    }
                    .navigationDestination(for: BasicRecipe.self) { BasicRecipe in
                        RecipeDetailView(id: BasicRecipe.idMeal)
                    }
                    .navigationTitle(category)
                }
            }
        }
        .task{
            do {
                try await model.fetchRecipes()
            } catch {
                print(error)
            }
        }
    }

    
}

#Preview {
    RecipeListView()
}
