//
//  IngredientsView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 23/09/24.
//

import SwiftUI

struct IngredientsView: View {
    let rows = [GridItem(.fixed(100))]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("INGREDIENTS")
                        .font(.system(size: 16))
                        .bold()
                    Rectangle()
                        .frame(width: 15, height: 2)
                        .foregroundStyle(.orange)
                }
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, content: {
                        ForEach(0..<5) { _ in
                            IngredientView()
                        }
                    })
                }
            }
            .padding()
        }
    }
}

struct IngredientView: View {
    var body: some View {
        VStack {
            Text("Onion")
                .font(.system(size: 20))
                .foregroundStyle(.orange)
            Text("1 finely sliced")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
        }
        .padding()
        .border(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    IngredientsView()
}

#Preview(body: {
    IngredientView()
})
