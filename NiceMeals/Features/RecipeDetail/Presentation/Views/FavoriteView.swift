//
//  FavoriteView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 20/11/24.
//

import SwiftUI

struct FavoriteView: View {
    let buttonCTA: () -> Void
    var body: some View {
        Button(action: {
            buttonCTA()
        }, label: {
            HStack {
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .frame(width: 20, height: 25)
                    .foregroundStyle(.blue)
                Text("Add to Favorites")
                    .font(.system(size: 14))
                    .foregroundStyle(.blue)
                    .fontDesign(.serif)
            }
        })
    }
}

#Preview {
    FavoriteView(){}
}
