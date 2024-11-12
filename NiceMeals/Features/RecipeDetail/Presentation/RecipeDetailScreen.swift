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
    init(recipieTitle: String, recipieSubTitle: String, image: Image?) {
        self.recipieTitle = recipieTitle
        self.recipieSubTitle = recipieSubTitle
        self.image = image ?? Image("sampleMeal")
    }
    init() {
        self.recipieTitle = "Chicken Burger"
        self.recipieSubTitle = "British"
        self.image = Image("sampleMeal")
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
                IngredientsView()
                DirectionsView()
                RecipeSourceView()
            }
        }
        .background(Color(uiColor: AppColors.lightSkin))
        .navigationTitle(recipieTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        RecipeDetailScreen()
    }
    
}
