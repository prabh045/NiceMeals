//
//  CategoryRowView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import SwiftUI

struct CategoryRowView: View {
    let categoryName: String
    let categoryDescription: String
    let imageUrl: URL?
    @State var categoryImage: Image?
    
    var body: some View {
        HStack(alignment: .center) {
            categoryImage?
                .resizable()
                .frame(width: 50, height: 50)
//            AsyncImage(url: imageUrl) { image in
//                image
//                    .resizable()
//                    .frame(width: 50, height: 50)
//            } placeholder: {
//                Image(systemName: "fork.knife.circle.fill")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//            }
            VStack(alignment: .leading) {
                Text(categoryName)
                    .font(.title)
                    .bold()
                Text(categoryDescription)
                    .lineLimit(4)
                    .font(.system(size: 15))
                    .fontDesign(.monospaced)
                    .foregroundStyle(.gray)
                    .fontWeight(.medium)
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onAppear {
            Task {
                let catImage = await ImageDownloader.fetchImage(for: imageUrl)
                DispatchQueue.main.async {
                    categoryImage = catImage
                }
            }
        }
        
    }
}

#Preview {
    CategoryRowView(categoryName: "Dessert", categoryDescription: "Yummy", imageUrl: nil)
}
