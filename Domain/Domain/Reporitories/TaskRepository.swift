//
//  TaskRepository.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift

public protocol TaskRepository {
    func getTasks() -> Single<[TaskEntity]>

    /*func getTask(id: Int) -> Single<TaskEntity>
    
    func saveTask(entity: TaskEntity) -> Single<Int>

    func deleteTask(id: Int) -> Completable*/
}
