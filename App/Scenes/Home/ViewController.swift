//
//  ViewController.swift
//  CleanArchitectureSample
//
//  Created by Luis Eduardo Talavera Rios on 8/15/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import UIKit
import Domain

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstUseCase.shared.testRun()
    }
}

