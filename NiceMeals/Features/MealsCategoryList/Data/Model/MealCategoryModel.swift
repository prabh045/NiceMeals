//
//  MealCategoriesModel.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import Foundation

struct MealCategoryModel: Decodable {
    let categories: [MealCategories]
}

extension MealCategoryModel {
    struct MealCategories: Decodable {
        let idCategory: String
        let strCategory: String
        let strCategoryThumb: String
        let strCategoryDescription: String
    }
}
