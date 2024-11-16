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
    @State var image: Image? = Image("sampleMeal")
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading, spacing: 15) {
                    Spacer()
                    Text(mealName)
                        .font(.custom("AmericanTypewriter", size: 18))
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .kerning(4)
                        .underline()
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 250)
                        .clipped()
                        
                }
               
                //.background(Color.green)
               // .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(LinearGradient(colors: [.yellow,.red,.orange], startPoint: UnitPoint(x:0,y:0), endPoint: UnitPoint(x:1,y:1)).opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onAppear {
                Task {
                    let image = await ImageDownloader.fetchImage(for: mealThumbnail)
                    DispatchQueue.main.async {
                         self.image = image
                    }
                }
            }
        }
    }
}

#Preview {
    MealColumnView(mealName: "Curry Yum!", mealThumbnail: nil)
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
