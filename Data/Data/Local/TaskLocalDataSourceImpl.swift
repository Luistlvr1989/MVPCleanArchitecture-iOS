//
//  TaskLocalDataSourceImpl.swift
//  Data
//
//  Created by Luis Eduardo Talavera Rios on 8/19/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Domain
import CoreData

public final class TaskLocalDataSourceImpl: TaskLocalDataSource {
    private let context: NSManagedObjectContext
    
    public init() {
        context = CoreDataManager.shared.container.viewContext
    }
     
    public func loadTasks() throws -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let result = try self.context.fetch(fetchRequest)
        return result
    }
    
    public func saveTasks(entities: [TaskEntity]) throws {
        try entities.forEach { entity in
            try self.saveTask(entity: entity)
        }
    }
    
    public func saveTask(entity: TaskEntity) throws {
        let task = try self.findOrCreateTask(id: entity.id!)
        task.fromEntity(entity: entity)
        try self.context.save()
    }
    
    private func findOrCreateTask(id: Int) throws -> Task {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %i", id)
        let result = try self.context.fetch(fetchRequest)
        
        if result.count != 0 {
           return result[0]
       } else {
           return Task(context: self.context)
       }
    }
}
