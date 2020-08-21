//
//  TaskPresenter.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/20/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift
import Domain

class TaskPresenterImpl: TaskPresenter {
    fileprivate var view: TaskView!
    fileprivate let saveTaskUseCase: SaveTaskUseCase
    
    let bag = DisposeBag()
    
    init(saveTaskUseCase: SaveTaskUseCase) {
        self.saveTaskUseCase = saveTaskUseCase
    }
    
    func attach<View>(view: View) where View : BaseView {
        self.view = (view as! TaskView)
    }
    
    func saveTask(task: TaskEntity) {
        saveTaskUseCase.buildUseCase(input: task)
            .do(onSubscribe: {
                self.view.showProgress()
            }, onDispose: {
                self.view.hideProgress()
            })
            .subscribe(onCompleted: {
                self.view.goToBack()
            }, onError: { error in
                self.view.showError(error: error.localizedDescription)
            }
        ).disposed(by: bag)
    }
}
