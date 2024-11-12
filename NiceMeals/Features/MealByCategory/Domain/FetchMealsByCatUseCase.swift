//
//  FetchMealsByCatUseCase.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 21/08/24.
//

import Foundation

protocol FetchMealsByCatUseCase {
    func execute() async -> Result<MealRecipeModel, ApiError>
}

struct FetchMealsByCatImpl: FetchMealsByCatUseCase {
    let mealByCatRepo: MealByCategoryRepo
    let category: String
    func execute() async -> Result<MealRecipeModel, ApiError> {
        await mealByCatRepo.fetchMealByCategory(category: category)
    }
}
