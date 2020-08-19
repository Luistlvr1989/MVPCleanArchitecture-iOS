//
//  GetPostsUseCase.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift

public final class GetTasksUseCase : SingleUseCase {
    public typealias Input = Void
    public typealias T = [TaskEntity]
    
    var repository: TaskRepository
    public let backgroundScheduler: SchedulerType
    public let foregroundScheduler: SchedulerType
    
    public init(
        repository: TaskRepository,
        backgroundScheduler: SchedulerType,
        foregroundScheduler: SchedulerType
    ) {
        self.repository = repository
        self.backgroundScheduler = backgroundScheduler
        self.foregroundScheduler = foregroundScheduler
    }
    
    public func generateSingle(input: Void? = nil) -> Single<[TaskEntity]> {
        return repository.getTasks()
    }
}
