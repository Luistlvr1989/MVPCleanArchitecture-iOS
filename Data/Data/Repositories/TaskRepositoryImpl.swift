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
        return remoteDataSource.fetchTasks()
            .flatMap({ dtos in
                let entities = dtos.map({ dto in dto.toEntity() })
                try self.localDataSource.saveTasks(entities: entities)
                return try self.loadTasks()
            })
    }
    
    private func loadTasks() throws -> Single<[TaskEntity]> {
        let tasks = try self.localDataSource.loadTasks()
            .map { dto in dto.toEntity() }
        return Single.just(tasks)
    }
    
    public func saveTask(entity: TaskEntity) -> Completable {
        return Completable.create { completable in
            do {
                try self.localDataSource.saveTask(entity: entity)
                completable(.completed)
            } catch {
                completable(.error(error))
            }
             
            return Disposables.create()
        }
    }
}

public protocol TaskLocalDataSource {
    func loadTasks() throws -> [Task]
    
    func saveTasks(entities: [TaskEntity]) throws
    
    func saveTask(entity: TaskEntity) throws
}

public protocol TaskRemoteDataSource {
    func fetchTasks() -> Single<[TaskDto]>
}

