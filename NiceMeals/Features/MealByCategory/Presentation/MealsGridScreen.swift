//
//  MealsListView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 15/08/24.
//

import SwiftUI

struct MealsGridScreen: View {
    private let rows = [
        GridItem()]
    let mealByCategoryViewModel: MealByCategoryViewModel
    let category: String
    
    init(category: String) {
        self.category = category
        mealByCategoryViewModel = MealByCategoryViewModel(
            fetchMealsByCatUseCase: FetchMealsByCatImpl(mealByCatRepo: MealsByCategoryRepoImpl(networkService: NetworkServiceImpl()), category: category))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 10) {
                    if 2 != 2 {
                        ContentUnavailableView("Nil", systemImage: "network")
                    } else {
                        ForEach(mealByCategoryViewModel.mealRecipeViewModel?.meals ?? []) {  meal in
                            NavigationLink(value: meal) {
                                MealColumnView(mealName: meal.mealName, mealThumbnail: meal.mealThumbnailUrl)
                                    .frame(width: geometry.size.width * 0.90)
                                    .padding(.leading, 10)
                            }
                        }
                    }
                }
            }
            //.background(Color(uiColor: AppColors.lightSkin))
            .navigationTitle("\(category) Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: MealRecipeEntity.self, destination: {  meal in
                RecipeDetailScreen(image: nil, mealRecipeEntity: meal)
            })
            .onAppear {
                Task {
                    await mealByCategoryViewModel.fetchMealsByCategory()
                }
            }
        }
    }
}

#Preview {
    MealsGridScreen(category: "Beef")
}
