//
//  CoreDataStack.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/9/21.
//

import Foundation
import CoreData

class CoreDataStack {
    private let modelName: String //create a private property to store the modelName
    
    //we always need this
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    //    modelName: String
    init() {
        self.modelName = "Defuse2" //initializer needed to save the modelName into the private property
    }
    
    //lazy instantiate the NSPersistentContainer, passing the modelName
    private lazy var storeContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores {(storeDescription, error) in
            if let error = error as NSError? {
                print("Error: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    //MARK: Save
    func saveContext () {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}

enum Result<T> {
    case success(T)
    case failure(Error)
}
