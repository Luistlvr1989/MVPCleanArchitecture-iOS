//
//  HomePresenter.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Domain
import RxSwift

class HomePresenterImpl: HomePresenter {
    fileprivate var view: HomeView!
    fileprivate let getTasksUseCase: GetTasksUseCase
    
    let bag = DisposeBag()
    
    init(getTasksUseCase: GetTasksUseCase) {
        self.getTasksUseCase = getTasksUseCase
    }
    
    func attach<View>(view: View) where View : BaseView {
        self.view = (view as! HomeView)
    }
    
    func loadTasks() {
        getTasksUseCase.buildUseCase()
            .do(onSubscribe: {
                self.view.showProgress()
            }, onDispose: {
                self.view.hideProgress()
            })
            .subscribe(onSuccess: { tasks in
                self.view.refreshData(tasks: tasks)
            }, onError: { error in
                self.view.showError(error: error.localizedDescription)
            }
        ).disposed(by: bag)
    }
}
