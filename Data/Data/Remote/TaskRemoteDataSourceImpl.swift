//
//  TaskRemoteDataSource.swift
//  Data
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift
import Domain

public final class TaskRemoteDataSourceImpl : TaskRemoteDataSource {
    public init() {
        
    }
    
    public func loadTasks() -> Single<[TaskEntity]> {
        return Single<[TaskEntity]>.create { single in
            let result = [
                TaskEntity(
                    id: 100,
                    title: "Nota 1",
                    description: "Descripción 1",
                    updated: Date(),
                    created: Date()
                ),
                TaskEntity(
                    id: 101,
                    title: "Nota 2",
                    description: "Descripción 2",
                    updated: Date(),
                    created: Date()
                )
            ]
            single(.success(result))
            
            return Disposables.create()
        }
    }
}
