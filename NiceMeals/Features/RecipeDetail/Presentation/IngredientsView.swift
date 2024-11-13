//
//  IngredientsView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 23/09/24.
//

import SwiftUI

struct IngredientsView: View {
    let rows = [GridItem(.fixed(100))]
    let ingredients: [(String, String)]
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
                        ForEach(0..<ingredients.count) { index in
                            let ingredientTuple = ingredients[index]
                            IngredientView(ingredients: ingredientTuple)
                        }
                    })
                }
            }
            .padding()
        }
    }
}

struct IngredientView: View {
    let ingredients: (ingredientTitle: String, ingredientMeasure: String)
    var body: some View {
        VStack {
            Text(ingredients.ingredientTitle)
                .font(.system(size: 20))
                .foregroundStyle(.orange)
            Text(ingredients.ingredientMeasure)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
        }
        .padding()
        .border(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    IngredientsView(ingredients: [("String", "String")])
}

#Preview(body: {
    IngredientView(ingredients: (ingredientTitle: "Sample", ingredientMeasure: "Measure"))
})
