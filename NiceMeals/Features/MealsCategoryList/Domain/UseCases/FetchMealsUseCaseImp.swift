//
//  FetchMealsUseCaseImp.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 09/08/24.
//

import Foundation

//some business logic we can write here. e.g if request need to be made after 5 minutes or something
struct FetchMealsUseCaseImp: FetchMealsUseCase {
    let mealsCategoryRepo: MealCategoryRepo
    
    func execute() async -> Result<MealCategoryModel, ApiError> {
        let result = await mealsCategoryRepo.fetchMealCategories()
        return result
    }
}
