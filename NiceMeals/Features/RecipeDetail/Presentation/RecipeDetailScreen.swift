//
//  RecipeDetailScreen.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 23/09/24.
//

import SwiftUI

struct RecipeDetailScreen: View {
    @State var image: Image
    let mealRecipeEntity: MealRecipeEntity?
    let recipeDetailViewModel: RecipeDetailViewModel = RecipeDetailViewModel()
    init(image: Image?, mealRecipeEntity: MealRecipeEntity) {
        self.image = Image("sampleMeal")
        self.mealRecipeEntity = mealRecipeEntity
    }
    init() {
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
                Text(recipeDetailViewModel.getRecipeTitle())
                    .font(.system(size: 20))
                    .bold()
                    .fontDesign(.monospaced)
                Text(recipeDetailViewModel.getRecipeArea())
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .fontDesign(.serif)
                IngredientsView(ingredients: recipeDetailViewModel.getRecipeIngredients())
                DirectionsView(directions: recipeDetailViewModel.getRecipeDirections())
                RecipeSourceView()
            }
        }
        .background(Color(uiColor: AppColors.lightSkin))
        .navigationTitle(recipeDetailViewModel.getRecipeTitle())
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                await recipeDetailViewModel.fetchRecipeDetails(for: "\(mealRecipeEntity?.mealId ?? "")")
                let image =  await ImageDownloader.fetchImage(for: mealRecipeEntity?.mealThumbnailUrl)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        RecipeDetailScreen()
    }
    
}
