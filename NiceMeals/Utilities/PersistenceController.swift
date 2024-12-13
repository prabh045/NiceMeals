//
//  PersistenceController.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 25/11/24.
//

import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Recipes")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }

    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("changes saved")
            } catch (let error) {
                print("error saving changes \(error.localizedDescription)")
            }
        }
    }
    
    func deleteEntity(id: String) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<FavoriteRecipes> = FavoriteRecipes.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                context.delete(object)
            }
            save()
            print("entity deletion success")
        } catch(let error) {
            print("Error deleting entity with id \(id): \(error.localizedDescription)")
        }
        
    }
    
    func checkEntityForExistence(for id: String) -> Bool {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<FavoriteRecipes> = FavoriteRecipes.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            let results = try context.fetch(fetchRequest)
            if results.first?.id == id {
                return true
            }
            return false
        } catch(let error) {
            print("Error finding entity with id \(id): \(error.localizedDescription)")
            return false
        }
    }
}
