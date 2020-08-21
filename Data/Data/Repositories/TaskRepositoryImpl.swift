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

public final class TaskRepositoryImpl: TaskRepository {
    private let localDataSource: TaskLocalDataSource
    private let remoteDataSource: TaskRemoteDataSource
    
    public init(localDataSource: TaskLocalDataSource, remoteDataSource: TaskRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    public func getTasks() -> Single<[TaskEntity]> {
        return remoteDataSource.loadTasks()
            .map { dtos in
                dtos.map({ dto in dto.toEntity()
            })
        }
    }
    
    public func saveTask(entity: TaskEntity) -> Completable {
        return localDataSource.saveTask(entity: entity)
    }
    
    public func deleteTask(id: Int) -> Completable {
        return localDataSource.deleteTask(id: id)
    }
}

public protocol TaskLocalDataSource {
    func saveTask(entity: TaskEntity) -> Completable
    
    func deleteTask(id: Int) -> Completable
}

public protocol TaskRemoteDataSource {
    func loadTasks() -> Single<[TaskDto]>
}

