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
    }
}

