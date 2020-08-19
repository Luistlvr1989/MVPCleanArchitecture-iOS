//
//  ViewController.swift
//  CleanArchitectureSample
//
//  Created by Luis Eduardo Talavera Rios on 8/15/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import UIKit
import Domain
import Data
import Swinject

class ViewController: UIViewController {
    var getTasksUseCase: GetTasksUseCase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTasksUseCase = Assembler.shared.resolver.resolve(GetTasksUseCase.self)
        let subscription = getTasksUseCase.buildUseCase()
            .subscribe { task in
                print(task)
            }
    }
}

