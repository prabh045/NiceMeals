//
//  MealCategoryRepoImpl.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 10/08/24.
//

import Foundation

struct MealCategoryRepoImpl: MealCategoryRepo {
    let networkService: NetworkServiceRepo
    func fetchMealCategories() async -> Result<MealCategoryModel, ApiError> {
        let result: Result<MealCategoryModel, ApiError> = await networkService.fetchData(for: "https://www.themealdb.com/api/json/v1/1/categories.php")
        return result
    }
}
