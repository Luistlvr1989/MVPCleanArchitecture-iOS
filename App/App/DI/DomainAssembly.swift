//
//  DomainAssembly.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift
import Swinject
import Domain

class DomainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SchedulerType.self, name: "background") { r in
            return ConcurrentDispatchQueueScheduler(qos: .background)
        }
        
        container.register(SchedulerType.self, name: "foreground") { r in
            return MainScheduler.instance
        }
        
        container.register(GetTasksUseCase.self) { r in
            return GetTasksUseCase(
                repository: r.resolve(TaskRepository.self)!,
                backgroundScheduler: r.resolve(SchedulerType.self, name: "background")!,
                foregroundScheduler: r.resolve(SchedulerType.self, name: "foreground")!
            )
        }
    }
}
