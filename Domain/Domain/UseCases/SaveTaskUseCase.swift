//
//  SaveTaskUseCase.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/20/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift

public final class SaveTaskUseCase: CompletableUseCase {
    public typealias Input = TaskEntity
    
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
    
    public func generateCompletable(input: TaskEntity?) -> Completable {
        return repository.saveTask(entity: input!)
    }
}
