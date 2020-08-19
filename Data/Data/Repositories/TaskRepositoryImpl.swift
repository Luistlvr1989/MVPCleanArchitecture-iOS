//
//  TaskRepositoryImpl.swift
//  Data
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift
import Domain

public final class TaskRepositoryImpl : TaskRepository {
    private var remoteDataSource: TaskRemoteDataSource
    
    public init(remoteDataSource: TaskRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getTasks() -> Single<[TaskEntity]> {
        return remoteDataSource.loadTasks()
    }
    
    /*public func getTask(id: Int) -> Single<TaskEntity> {
        <#code#>
    }
    
    public func saveTask(entity: TaskEntity) -> Single<Int> {
        <#code#>
    }
    
    public func deleteTask(id: Int) -> Completable {
        <#code#>
    }*/
}

public protocol TaskRemoteDataSource {
    func loadTasks() -> Single<[TaskEntity]>
}

