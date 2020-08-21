//
//  HomeContract.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Domain

protocol HomeView: BaseView {
    func refreshData(tasks: [TaskEntity])
}

protocol HomePresenter: BasePresenter {
    func loadTasks()
}
