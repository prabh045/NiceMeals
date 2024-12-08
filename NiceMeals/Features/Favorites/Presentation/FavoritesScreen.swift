//
//  FavoritesScreen.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 20/11/24.
//

import SwiftUI
import CoreData

struct FavoritesScreen: View {
    private let columns = [GridItem()]
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var favoriteRecipes: FetchedResults<FavoriteRecipes>
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 15) {
                        if favoriteRecipes.isEmpty {
                            ContentUnavailableView("You have not added any favorites yet!!", systemImage: "fork.knife.circle")
                        } else {
                            ForEach(favoriteRecipes, id: \.id) {  favRecipe in
                                NavigationLink(value: favRecipe) {
                                    MealColumnView(mealEntity: MealRecipeEntity.initFrom(entity: favRecipe))
                                        .frame(width: geometry.size.width * 0.90, height: 300)
                                        .shadow(radius: 8)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Favorite Recipes")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationDestination(for: MealRecipeEntity.self, destination: {  meal in
                    RecipeDetailScreen(image: nil, mealRecipeEntity: meal)
                })
            }
            .background(AppColors.appGradient.opacity(0.15))
        }
    }
}

#Preview {
    FavoritesScreen()
}
