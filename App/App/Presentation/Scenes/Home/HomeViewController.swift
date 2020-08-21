//
//  ViewController.swift
//  CleanArchitectureSample
//
//  Created by Luis Eduardo Talavera Rios on 8/15/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import UIKit
import Domain
import Data
import Swinject

class HomeViewController: UIViewController, HomeView {
    fileprivate lazy var presenter: HomePresenter = {
        return createPresenter(of: HomePresenter.self)
    }()
    
    @IBOutlet var tasksTableView: UITableView!
    
    fileprivate var tasks: [TaskEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.loadTasks()
    }
    
    fileprivate func prepareUI() {
        title = "ToDo"
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }
    
    @IBAction func addTask(_ sender: Any) {
        goToTaskDetail()
    }
    
    fileprivate func goToTaskDetail(task: TaskEntity? = nil) {
        let vc = TaskViewController.newInstance(storyboard: storyboard)
        if task != nil {
            vc.task = task!
        } else {
            vc.task.id = tasks.count
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func refreshData(tasks: [TaskEntity]) {
        self.tasks = tasks
        self.tasksTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let task = tasks[indexPath.row]
        goToTaskDetail(task: task)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TaskTableViewCell.create(tableView, indexPath: indexPath)
        let task = tasks[indexPath.row]
        cell.bindTo(task: task)
        return cell
    }
}
