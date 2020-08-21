//
//  TaskLocalDataSourceImpl.swift
//  Data
//
//  Created by Luis Eduardo Talavera Rios on 8/19/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift
import Domain

public final class TaskLocalDataSourceImpl: TaskLocalDataSource {
    public init() {
        
    }
     
    public func saveTask(entity: TaskEntity) -> Completable {
        return Completable.create { completable in
            /*let task = Task(context: self.context)
            task.fromEntity(entity: entity)
            
            do {
                try self.context.save()
             } catch {
                completable(.error(error))
            }*/
             
            completable(.completed)
             
            return Disposables.create()
        }
    }
     
    public func deleteTask(id: Int) -> Completable {
        return Completable.create { completable in
            
            completable(.completed)
            
            return Disposables.create()
        }
    }
}
