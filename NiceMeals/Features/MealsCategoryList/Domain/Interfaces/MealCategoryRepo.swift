//
//  MealCategoryRepo.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 08/08/24.
//

import Foundation

protocol MealCategoryRepo {
    func fetchMealCategories() async -> Result<MealCategoryModel, ApiError>
}

