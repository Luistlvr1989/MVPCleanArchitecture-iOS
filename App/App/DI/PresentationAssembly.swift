//
//  PresentationAssembly.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift
import Swinject
import Domain

class PresentationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomePresenter.self) { r in
            return HomePresenterImpl(
                getTasksUseCase: r.resolve(GetTasksUseCase.self)!
            )
        }
        
        container.register(TaskPresenter.self) { r in
            return TaskPresenterImpl(
                saveTaskUseCase: r.resolve(SaveTaskUseCase.self)!
            )
        }
    }
}
