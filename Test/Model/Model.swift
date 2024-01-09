//
//  Model.swift
//  Test
//
//  Created by Andy Li on 1/9/24.
//

import Foundation


struct CategoryRecipeResponse: Codable {
  var meals: [BasicRecipe]
}

struct BasicRecipe: Codable, Hashable {
    var strMeal: String
    var idMeal: String
}


struct DetailRecipeResponse: Decodable {
    var meals: [DetailRecipe]
}

struct DetailRecipe: Decodable, Hashable {
    var idMeal, strMeal, strCategory, strInstructions: String?
    let ingredients: [Ingredient]?
}

struct Ingredient: Decodable, Hashable {
    let name: String
    let measure: String
    let index: Int
}



// Custom Decoder to decode the JSON
// Found this online
extension DetailRecipe {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        var index = 1
        var ingredients: [Ingredient] = []
        while let ingredient = mealDict["strIngredient\(index)"] as? String,
              let measure = mealDict["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredients.append(.init(name: ingredient, measure: measure, index: index))
            index += 1
        }//: while
            self.ingredients = ingredients
            idMeal = mealDict["idMeal"] as? String ?? ""
            strMeal = mealDict["strMeal"] as? String ?? ""
            strCategory = mealDict["strCategory"] as? String ?? ""
            strInstructions = mealDict["strInstructions"] as? String ?? ""
    }
}



