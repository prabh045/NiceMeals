//
//  FetchMealsUseCase.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 09/08/24.
//

import Foundation

protocol FetchMealsUseCase {
    func execute() async -> Result<MealCategoryModel, ApiError>
}
