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
import Alamofire
import RxAlamofire

public final class TaskRemoteDataSourceImpl: TaskRemoteDataSource {
    fileprivate let fetchTasksUrl: String
    
    public init() {
        fetchTasksUrl = ApiResources.BASE_URL + ApiResources.VERSION + "/5e52db362d0000f622357be6"
    }
    
    public func loadTasks() -> Single<[TaskDto]> {
        return RxAlamofire.requestJSON(.get, fetchTasksUrl)
            .asSingle()
            .flatMap { (_, json) -> Single<[TaskDto]> in
                var taskDtos: [TaskDto] = []
                if let tasksArray = json as? [[String: AnyObject]] {
                    for taskJson in tasksArray {
                        let taskDto = TaskDto.from(taskJson as NSDictionary)!
                        taskDtos.append(taskDto)
                    }
                }
                
                return .just(taskDtos)
            }
    }
}
