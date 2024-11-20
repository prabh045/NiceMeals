//
//  FavoritesScreen.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 20/11/24.
//

import SwiftUI

struct FavoritesScreen: View {
    private let columns = [GridItem()]
    let favorites = ["Apple, Mango"]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 15) {
                    if 2 != 2 {
                        ContentUnavailableView("Nil", systemImage: "network")
                    } else {
                        ForEach(favorites, id: \.self) {  fav in
                            NavigationLink(value: fav) {
                                Text(fav)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorite Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: MealRecipeEntity.self, destination: {  meal in
                RecipeDetailScreen(image: nil, mealRecipeEntity: meal)
            })
            .onAppear {
                Task {
                    //await mealByCategoryViewModel.fetchMealsByCategory()
                }
            }
        }
        .background(AppColors.appGradient.opacity(0.15))
    }
}

#Preview {
    FavoritesScreen()
}
