//
//  RemoveFavoriteView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 09/12/24.
//

import SwiftUI

struct RemoveFavoriteView: View {
    var buttonCTA: () -> Void
    var body: some View {
        Button {
            buttonCTA()
        } label: {
            HStack {
                Image(systemName: "hand.thumbsdown.fill")
                    .resizable()
                    .frame(width: 20, height: 25)
                    .foregroundStyle(.red)
                Text("Remove from Favorites")
                    .font(.system(size: 14))
                    .foregroundStyle(.red)
                    .fontDesign(.serif)
            }
        }
    }
}

#Preview {
    RemoveFavoriteView() {}
}
