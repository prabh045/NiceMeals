//
//  FavoriteView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 20/11/24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        Image(systemName: "star.fill")
            .onTapGesture {
                print("fav tapped")
            }
    }
}

#Preview {
    FavoriteView()
}
