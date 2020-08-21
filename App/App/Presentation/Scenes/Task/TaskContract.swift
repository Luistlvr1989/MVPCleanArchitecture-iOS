//
//  TaskContract.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/20/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Domain

protocol TaskView: BaseView {
    func goToBack()
}

protocol TaskPresenter: BasePresenter {
    func saveTask(task: TaskEntity)
}
