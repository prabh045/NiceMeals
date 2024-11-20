//
//  RecipeSourceView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 24/09/24.
//

import SwiftUI

struct RecipeSourceView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("[Recipe-Source](https://www.bbcgoodfood.com/recipes/15-minute-chicken-halloumi-burgers)")
                .font(.system(size: 12))
            Spacer()
        }
        .padding()
    }
}

#Preview {
    RecipeSourceView()
}
