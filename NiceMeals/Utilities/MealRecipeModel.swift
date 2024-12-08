//
//  MealRecipeModel.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 21/08/24.
//

import Foundation

struct MealRecipeModel: Decodable {
    let meals: [MealModel]
    struct MealModel: Decodable {
        let strMeal: String
        let strMealThumb: String
        let idMeal: String
        
        static func testMeal() -> Self {
            MealModel(strMeal: "", strMealThumb: "", idMeal: "")
        }
    }
}

struct RecipeDetailModel: Decodable {
    let meals: [RecipeDetailModel]
    struct RecipeDetailModel: Decodable {
        let idMeal: String
        let strMeal: String
        let strArea: String?
        let strInstructions: String?
        let strMealThumb: String?
        let strTags: String?
        let strYoutube: String?
        let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20: String?
        let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20: String?
        let strSource: String?
    }
}
