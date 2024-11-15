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
    
    func getRecipeIngredients() -> [(String, String)] {
        guard let mealData = recipeDetailModel?.meals.first else {
            return [("N/A", "N/A")]
        }
        var ingredientArray = [(String, String)]()
        ingredientArray.append((mealData.strIngredient1.unwrappedValue(), mealData.strMeasure1.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient2.unwrappedValue(), mealData.strMeasure2.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient3.unwrappedValue(), mealData.strMeasure3.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient4.unwrappedValue(), mealData.strMeasure4.unwrappedValue()))
        //MARK:5-9
        ingredientArray.append((mealData.strIngredient5.unwrappedValue(), mealData.strMeasure5.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient6.unwrappedValue(), mealData.strMeasure6.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient7.unwrappedValue(), mealData.strMeasure7.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient8.unwrappedValue(), mealData.strMeasure8.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient9.unwrappedValue(), mealData.strMeasure9.unwrappedValue()))
        //MARK:10-15
        ingredientArray.append((mealData.strIngredient10.unwrappedValue(), mealData.strMeasure10.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient11.unwrappedValue(), mealData.strMeasure11.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient12.unwrappedValue(), mealData.strMeasure12.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient13.unwrappedValue(), mealData.strMeasure13.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient14.unwrappedValue(), mealData.strMeasure14.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient15.unwrappedValue(), mealData.strMeasure15.unwrappedValue()))
        //MARK:16-20
        ingredientArray.append((mealData.strIngredient16.unwrappedValue(), mealData.strMeasure16.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient17.unwrappedValue(), mealData.strMeasure17.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient18.unwrappedValue(), mealData.strMeasure18.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient19.unwrappedValue(), mealData.strMeasure19.unwrappedValue()))
        ingredientArray.append((mealData.strIngredient20.unwrappedValue(), mealData.strMeasure20.unwrappedValue()))
        return ingredientArray
    }
    
    func getRecipeDirections() -> String {
        guard let mealData = recipeDetailModel?.meals.first else {
            return "No Directions Available"
        }
        return mealData.strInstructions.unwrappedValue()
    }
    
    func getRecipeArea() -> String {
        guard let mealData = recipeDetailModel?.meals.first else {
            return "No Area Available"
        }
        return mealData.strArea.unwrappedValue()
    }
    
    func getRecipeTitle() -> String {
        guard let mealData = recipeDetailModel?.meals.first else {
            return "No Title Available"
        }
        return mealData.strMeal
    }
}
