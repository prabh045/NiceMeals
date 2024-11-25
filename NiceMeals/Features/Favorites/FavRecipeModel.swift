//
//  FavRecipeModel.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 20/11/24.
//

import Foundation

struct FavRecipeModel {
    let favRecipeId: String
    let favRecipeTitle: String
    let favRecipeArea: String
    let ingredients: [(String, String)]
    let favRecipeInstructions: String
    let favRecipeSource: String
    let favRecipeImage: Data?
}
