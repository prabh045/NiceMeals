//
//  MockFetchMealsuseCase.swift
//  NiceMealsTests
//
//  Created by Prabhdeep Singh on 21/12/24.
//

import Foundation
@testable import NiceMeals

class MockFetchMealsUseCaseImp: FetchMealsUseCase {
    var didCallExecute = false
    var isSuccess = true
    func execute() async -> Result<NiceMeals.MealCategoryModel, NiceMeals.ApiError> {
        didCallExecute = true
        return mealCategoryListCheck(isSuccess: isSuccess)
    }
    
    func mealCategoryListCheck(isSuccess: Bool) -> Result<NiceMeals.MealCategoryModel, NiceMeals.ApiError> {
        let model = try! JSONDecoder().decode(NiceMeals.MealCategoryModel.self, from: mockData)
        if isSuccess {
            return .success(model)
        }
        return .failure(.invalidModel)
    }
}

fileprivate let mockData = Data("""
{
  "categories": [
    {
      "idCategory": "1",
      "strCategory": "Beef",
      "strCategoryThumb": "https://www.themealdb.com/images/category/beef.png",
      "strCategoryDescription": "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
    },
    {
      "idCategory": "2",
      "strCategory": "Chicken",
      "strCategoryThumb": "https://www.themealdb.com/images/category/chicken.png",
      "strCategoryDescription": "Chicken is a type of domesticated fowl, a subspecies of the red junglefowl. It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets."
    },
] }
""".utf8)
