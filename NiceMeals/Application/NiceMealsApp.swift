//
//  NiceMealsApp.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import SwiftUI
import SwiftData

@main
struct NiceMealsApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .onChange(of: scenePhase) { (_,_) in
            persistenceController.save()
        }
    }
}
