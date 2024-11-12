//
//  MealsByCategoryRepo.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 21/08/24.
//

import Foundation

protocol MealByCategoryRepo {
    func fetchMealByCategory(category: String) async -> Result<MealRecipeModel, ApiError>
}

struct MealsByCategoryRepoImpl: MealByCategoryRepo {
    let networkService: NetworkServiceRepo
    func fetchMealByCategory(category: String) async -> Result<MealRecipeModel, ApiError> {
        await networkService.fetchData(for: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)")
    }
}
