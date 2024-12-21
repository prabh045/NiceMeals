//
//  CategoryListView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import SwiftUI

struct CategoryListScreen: View {
    let mealCategoryViewModel = MealCategoryListViewModel(fetchMealsCategoryUseCase: FetchMealsUseCaseImp(mealsCategoryRepo:  MealCategoryRepoImpl(networkService: NetworkServiceImpl())))
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                if mealCategoryViewModel.mealViewModel == nil  {
                    ContentUnavailableView("Nil", systemImage: "network")
                } else {
                    ForEach(mealCategoryViewModel.mealViewModel!.mealCategories(by: searchText)) {  category in
                        NavigationLink(value: category) {
                            CategoryRowView(categoryName: category.mealName, categoryDescription: category.mealDescription, imageUrl: category.mealImageUrl)
                                .shadow(radius: 5)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Recipe Categories")
            .listRowSpacing(-10)
            .listRowSeparator(.hidden, edges: .all)
            .scrollContentBackground(.hidden)
            .background(AppColors.appGradient.opacity(0.15))
            .navigationDestination(for: MealCategoryViewModel.self) { meal in
                MealsGridScreen(category: meal.mealName)
            }
            .onAppear {
                Task {
                    await mealCategoryViewModel.fetchMeals()
                }
            }
            .searchable(text: $searchText, prompt: "Let's search for a Category")
        }
    }
}

#Preview {
    CategoryListScreen()
}
