//
//  MealByCategoryViewModel.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 21/08/24.
//

import Foundation

@Observable
class MealByCategoryViewModel {
    let fetchMealsByCatUseCase: FetchMealsByCatUseCase
    var mealRecipeViewModel: MealRecipeViewModel?
    
    init(fetchMealsByCatUseCase: FetchMealsByCatUseCase) {
        self.fetchMealsByCatUseCase = fetchMealsByCatUseCase
    }
    
    func fetchMealsByCategory() async {
        let result = await fetchMealsByCatUseCase.execute()
        switch result {
        case .success(let recipeModel):
            mealRecipeViewModel = MealRecipeViewModel(recipeModel: recipeModel)
        case .failure(let apiError):
            print("Failure in getting recipieModel \(apiError)")
        }
    }
}

struct MealRecipeViewModel: Identifiable {
    let id = UUID()
    let recipeModel: MealRecipeModel
    
    init(recipeModel: MealRecipeModel) {
        self.recipeModel = recipeModel
    }
    
    var meals: [MealRecipeEntity] {
        recipeModel.meals.map { MealRecipeEntity(recipeModel: $0) }
    }
    
    func meals(by recipeSearch: String) -> [MealRecipeEntity] {
        if recipeSearch.isEmpty {
            return recipeModel.meals.map { MealRecipeEntity(recipeModel: $0) }
        }
        let filteredResults = recipeModel.meals.filter { meal in
            meal.strMeal.lowercased().contains(recipeSearch.lowercased())
        }
        return filteredResults.map { MealRecipeEntity(recipeModel: $0) }
    }
}

struct MealRecipeEntity: Identifiable {
    let id = UUID()
    let recipeModel: MealRecipeModel.MealModel
    
    var mealName: String {
        recipeModel.strMeal
    }
    var mealThumbnailString: String {
        recipeModel.strMealThumb
    }
    var mealThumbnailUrl: URL? {
        URL(string: mealThumbnailString)
    }
}

extension MealRecipeEntity: Hashable {
    static func == (lhs: MealRecipeEntity, rhs: MealRecipeEntity) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension MealRecipeEntity {
    var mealId: String {
        return recipeModel.idMeal
    }
}

