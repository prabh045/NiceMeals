//
//  CategoryListView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import SwiftUI

struct CategoryListScreen: View {
    let mealCategoryViewModel = MealCategoryListViewModel(fetchMealsCategoryUseCase: FetchMealsUseCaseImp(mealsCategoryRepo:  MealCategoryRepoImpl(networkService: NetworkServiceImpl())))
    
    var body: some View {
        NavigationStack {
            List {
                if mealCategoryViewModel.mealViewModel == nil  {
                    ContentUnavailableView("Nil", systemImage: "network")
                } else {
                    ForEach(mealCategoryViewModel.mealViewModel!.mealCategories) {  category in
                        //CategoryRowView(categoryName: category.mealName, categoryDescription: category.mealDescription, imageUrl: category.mealImageUrl)
                        NavigationLink(value: category) {
                            CategoryRowView(categoryName: category.mealName, categoryDescription: category.mealDescription, imageUrl: category.mealImageUrl)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Recipe Categories")
            .listRowSpacing(-10)
            .listRowSeparator(.hidden)
            .scrollContentBackground(.hidden)
            .background(Color(uiColor: AppColors.lightSkin))
            .navigationDestination(for: MealCategoryViewModel.self) { meal in
                MealsGridScreen(category: meal.mealName)
            }
            .onAppear {
                Task {
                    await mealCategoryViewModel.fetchMeals()
                }
            }
        }
    }
}

#Preview {
    CategoryListScreen()
}
