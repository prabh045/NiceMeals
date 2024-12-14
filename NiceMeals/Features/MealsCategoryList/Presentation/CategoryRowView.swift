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
    @State var categoryImage: Image = Image(systemName: "fork.knife.circle.fill")
    
    var body: some View {
        HStack(alignment: .center) {
            categoryImage
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
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
                    withAnimation(.smooth(duration: 1.5)) {
                        categoryImage = catImage
                    }
                }
            }
        }
        
    }
}

#Preview {
    CategoryRowView(categoryName: "Dessert", categoryDescription: "Yummy", imageUrl: nil)
}
