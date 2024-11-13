//
//  RecipeDetailScreen.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 23/09/24.
//

import SwiftUI

struct RecipeDetailScreen: View {
    let recipieTitle: String
    let recipieSubTitle: String
    let image: Image
    let mealRecipeEntity: MealRecipeEntity?
    let recipeDetailViewModel: RecipeDetailViewModel = RecipeDetailViewModel()
    init(recipieTitle: String, recipieSubTitle: String, image: Image?, mealRecipeEntity: MealRecipeEntity) {
        self.recipieTitle = recipieTitle
        self.recipieSubTitle = recipieSubTitle
        self.image = image ?? Image("sampleMeal")
        self.mealRecipeEntity = mealRecipeEntity
    }
    init() {
        self.recipieTitle = "Chicken Burger"
        self.recipieSubTitle = "British"
        self.image = Image("sampleMeal")
        self.mealRecipeEntity = nil
    }
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.40)
                Text(recipieTitle)
                    .font(.system(size: 20))
                    .bold()
                    .fontDesign(.monospaced)
                Text(recipieSubTitle)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .fontDesign(.serif)
                IngredientsView(ingredients: recipeDetailViewModel.getIngredients())
                DirectionsView(directions: recipeDetailViewModel.getDirections())
                RecipeSourceView()
            }
        }
        .background(Color(uiColor: AppColors.lightSkin))
        .navigationTitle(recipieTitle)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                await recipeDetailViewModel.fetchRecipeDetails(for: "\(mealRecipeEntity?.mealId ?? "")")
            }
        }
    }
}

#Preview {
    NavigationView {
        RecipeDetailScreen()
    }
    
}
