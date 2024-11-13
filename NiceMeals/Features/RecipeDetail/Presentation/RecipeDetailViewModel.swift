//
//  RecipeDetailViewModel.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 12/11/24.
//

import Foundation

@Observable
class RecipeDetailViewModel {
    var recipeDetailModel: RecipeDetailModel?
    
    @MainActor
    func fetchRecipeDetails(for id: String) async {
        let result: Result<RecipeDetailModel, ApiError> = await NetworkServiceImpl().fetchData(for: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")
        do {
            recipeDetailModel = try result.get()
        } catch (let error) {
            print("error while getting recipedetail model \(error.localizedDescription)")
        }
       // return result
    }
    
    func getIngredients() -> [(String, String)] {
        guard let mealData = recipeDetailModel?.meals.first else {
            return [("N/A", "N/A")]
        }
        var ingredientArray = [(String, String)]()
        ingredientArray.append((mealData.strIngredient1, mealData.strMeasure1))
        ingredientArray.append((mealData.strIngredient2, mealData.strMeasure2))
        ingredientArray.append((mealData.strIngredient3, mealData.strMeasure3))
        ingredientArray.append((mealData.strIngredient4, mealData.strMeasure4))
        return ingredientArray
    }
    
    func getDirections() -> String {
        guard let mealData = recipeDetailModel?.meals.first else {
            return "No Directions Available"
        }
        return mealData.strInstructions
    }
}
