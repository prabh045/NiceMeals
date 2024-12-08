//
//  ContentView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            CategoryListScreen()
                .tabItem {
                    Label("Categories", systemImage: "menucard")
                }
            FavoritesScreen()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
    
}

#Preview {
    ContentView()
}
