//
//  CreateViewController.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/19/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import UIKit
import Domain

class TaskViewController: UIViewController, TaskView {
    fileprivate static let storyboardIdentifier = "TaskStoryboard"
    
    static func newInstance(storyboard: UIStoryboard?) -> TaskViewController {
        return storyboard?.instantiateViewController(withIdentifier: storyboardIdentifier) as! TaskViewController
    }
    
    fileprivate lazy var presenter: TaskPresenter = {
        return createPresenter(of: TaskPresenter.self)
    }()
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    
    var task = TaskEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    fileprivate func prepareUI() {
        titleTextField.text = task.title
        descriptionTextView.text = task.description
    }

    @IBAction func saveTask(_ sender: Any) {
        task.title = titleTextField.text ?? ""
        task.description = descriptionTextView.text
        task.updated = Date()
        presenter.saveTask(task: task)
    }
    
    func goToBack() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
