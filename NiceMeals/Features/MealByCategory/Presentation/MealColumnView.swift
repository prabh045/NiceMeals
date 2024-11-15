//
//  MealRowView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 15/08/24.
//

import SwiftUI

struct MealColumnView: View {
    let mealName: String
    let mealThumbnail: URL?
    @State var image: Image?
    
    var body: some View {
        //        VStack(alignment: .leading) {
        //            Image(systemName: "mug.fill")
        //                .resizable()
        //                .frame(width: 100, height: 100)
        ////            AsyncImage(url: mealThumbnail) { image in
        ////                image
        ////                    .resizable()
        ////                    .frame(width: 100, height: 100)
        ////            } placeholder: {
        ////                Image(systemName: "network")
        ////                    .resizable()
        ////                    .frame(width: 100, height: 100)
        ////                    .foregroundStyle(.white)
        ////            }
        //            Text(mealName)
        //                .font(.custom("Helvetica", size: 12))
        //                .foregroundStyle(.black)
        //                .bold()
        //                .lineLimit(2)
        //        }
        //        .padding()
        //        .background(Color.white)
        //        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        ZStack(content: {
            GeometryReader { geometry in
                VStack(spacing: 30) {
                    ZStack {
                        Rectangle()
                            .fill(Color(.gray))
                            .aspectRatio(1, contentMode: .fit)
                        image?
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .background(Color.white)
                            .layoutPriority(-1)
                    }
                    .clipped()
                    Text(mealName)
                        .font(.custom("AmericanTypewriter", size: 20))
                        .foregroundStyle(.black)
                        .fontWeight(.thin)
                        .lineLimit(2)
                        .kerning(14)
                        .underline()
                }
            }
        })
        .background(Color(uiColor: AppColors.lightSkin))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onAppear {
            Task {
                let image = await ImageDownloader.fetchImage(for: mealThumbnail)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        // .padding()
    }
}

#Preview {
    MealColumnView(mealName: "Curry Yum!", mealThumbnail: nil)
}
