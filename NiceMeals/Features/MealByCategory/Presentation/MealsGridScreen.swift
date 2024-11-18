//
//  MealsListView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 15/08/24.
//

import SwiftUI

struct MealsGridScreen: View {
    private let columns = [GridItem()]
    let mealByCategoryViewModel: MealByCategoryViewModel
    let category: String
    @State private var searchText = ""
    
    init(category: String) {
        self.category = category
        mealByCategoryViewModel = MealByCategoryViewModel(
            fetchMealsByCatUseCase: FetchMealsByCatImpl(mealByCatRepo: MealsByCategoryRepoImpl(networkService: NetworkServiceImpl()), category: category))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 15) {
                    if 2 != 2 {
                        ContentUnavailableView("Nil", systemImage: "network")
                    } else {
                        ForEach(mealByCategoryViewModel.mealRecipeViewModel?.meals(by: searchText) ?? []) {  meal in
                            NavigationLink(value: meal) {
                                MealColumnView(mealName: meal.mealName, mealThumbnail: meal.mealThumbnailUrl)
                                    .frame(width: geometry.size.width * 0.90, height: 300)
                                    .shadow(radius: 8)

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
            .searchable(text: $searchText, prompt: "Let's search for a Recipe")
        }
        .background(AppColors.appGradient.opacity(0.15))
    }
}

#Preview {
    MealsGridScreen(category: "Beef")
}
