//
//  RecipeSourceView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 24/09/24.
//

import SwiftUI

struct RecipeSourceView: View {
    let source: String
    var body: some View {
        HStack {
            Spacer()
            Link("Recipe-Source", destination: URL(string: source) ?? URL(string: "https://www.apple.com")!)
                .font(.system(size: 12))
                .foregroundStyle(.blue)
//            Text("[Recipe-Source](https://www.bbcgoodfood.com/recipes/15-minute-chicken-halloumi-burgers)")
//                .font(.system(size: 12))
            Spacer()
        }
        .padding()
    }
}

#Preview {
    RecipeSourceView(source: "https://www.bbcgoodfood.com/recipes/15-minute-chicken-halloumi-burgers")
}
