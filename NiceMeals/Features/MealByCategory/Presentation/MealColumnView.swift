//
//  MealRowView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 15/08/24.
//

import SwiftUI

struct MealColumnView: View {
    @State var image: Image? = Image("spices")
    let mealEntity: MealRecipeEntity
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading, spacing: 15) {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(mealEntity.mealName)
                            .font(.custom("AmericanTypewriter", size: 18))
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .kerning(4)
                            .underline()
                            .padding(.leading, 5)
                        Spacer()
                        Spacer()
                    }
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width * 0.95, height: 245)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.bottom, 15)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color(uiColor: AppColors.lightSkin))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onAppear {
                Task {
                    let image = await ImageDownloader.fetchImage(for: mealEntity.mealThumbnailUrl)
                    DispatchQueue.main.async {
                         self.image = image
                    }
                }
            }
        }
    }
}

#Preview {
    MealColumnView(mealEntity: MealRecipeEntity.testMealRecipeEntity())
}

//MARK: For future help

//                    ZStack {
//                        Rectangle()
//                            .fill(Color(.gray))
//                            .aspectRatio(1, contentMode: .fit)
//                        image?
//                            .resizable()
//                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                            .background(Color.white)
//                            .layoutPriority(-1)
//                    }
//                    .clipped()
