//
//  CoreDataManager.swift
//  Data
//
//  Created by Luis Eduardo Talavera Rios on 8/20/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let frameworkIdentifier = "com.globant.Data"
    let dataModelIdentifier = "ToDo"
    
    let container : NSPersistentContainer!

    init() {
        let frameworkBundle = Bundle.init(identifier: frameworkIdentifier)
        let dataModelURL = frameworkBundle!.url(forResource: dataModelIdentifier, withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: dataModelURL)
        container = NSPersistentContainer(name: dataModelIdentifier, managedObjectModel: managedObjectModel!)
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
