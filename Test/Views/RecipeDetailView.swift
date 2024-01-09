//
//  RecipeDetailView.swift
//  Test
//
//  Created by Andy Li on 1/10/24.
//

import SwiftUI

struct RecipeDetailView: View {
    var id: String
    @Environment(RecipeViewModel.self) var model
    
    var body: some View {
        VStack{
            if (model.DetailRecipe == nil || model.DetailRecipe?.idMeal != id) {
              ProgressView()
            } else {
                    Form {
                        Section("Name") {
                            Text(model.DetailRecipe!.strMeal!)
                        }
                        Section("Instructions") {
                            Text(model.DetailRecipe!.strInstructions!)
                                
                        }
                        Section("Ingredients") {
                            List((model.DetailRecipe?.ingredients)!, id: \.self) { ingredient in
                                HStack{
                                    Text(ingredient.name)
                                    Spacer()
                                    Text(ingredient.measure)
                                }
                                
                            }
                        }
                    }
                
                
            }
        }
        .navigationTitle(model.DetailRecipe?.strMeal ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .task{
            do {
                try await model.fetchRecipeDetail(id: id)
            } catch {
                print(error)
            }
        }
    }
}


#Preview {
    RecipeDetailView(id: "")
}
