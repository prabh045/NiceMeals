//
//  MealCategoryViewModel.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 05/08/24.
//

import SwiftUI

@Observable class MealCategoryListViewModel {
    var mealViewModel: MealViewModel?
    let fetchMealsCategoryUseCase: FetchMealsUseCase
    
    init(mealViewModel: MealViewModel? = nil, fetchMealsCategoryUseCase: FetchMealsUseCase) {
        self.mealViewModel = mealViewModel
        self.fetchMealsCategoryUseCase = fetchMealsCategoryUseCase
    }
    
    func fetchMeals() async {
        let result = await fetchMealsCategoryUseCase.execute()
        switch result {
        case .success(let mealCatModel):
            print("Success")
            self.mealViewModel = MealViewModel(mealCatModel: mealCatModel)
        case .failure(let apiError):
            print("Some Error \(apiError)")
        }
    }
}

struct MealViewModel: Identifiable {
    private let mealCatModel: MealCategoryModel
    let id = UUID()
    
    init(mealCatModel: MealCategoryModel) {
        self.mealCatModel = mealCatModel
    }
    
    var mealCategories: [MealCategoryViewModel] {
       return mealCatModel.categories.map {
            MealCategoryViewModel(mealCatModel: $0)
        }
    }
    
    func mealCategories(by category: String) -> [MealCategoryViewModel] {
        if category.isEmpty {
            return mealCatModel.categories.map {
                 MealCategoryViewModel(mealCatModel: $0)
             }
        }
        let filtered = mealCatModel.categories.filter { meal in
            meal.strCategory.lowercased().contains(category.lowercased())
        }
        return filtered.map {
            MealCategoryViewModel(mealCatModel: $0)
        }
    }
}

struct MealCategoryViewModel: Identifiable {
    private let mealCatModel: MealCategoryModel.MealCategories
    let id = UUID()
    
    init(mealCatModel: MealCategoryModel.MealCategories) {
        self.mealCatModel = mealCatModel
    }
    
    var mealName: String {
        mealCatModel.strCategory
    }
    var mealDescription: String {
        mealCatModel.strCategoryDescription
    }
    var mealImageString: String {
        mealCatModel.strCategoryThumb
    }
    var mealImageUrl: URL? {
        URL(string: mealCatModel.strCategoryThumb)
    }
}

extension MealCategoryViewModel: Hashable {
    static func == (lhs: MealCategoryViewModel, rhs: MealCategoryViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
