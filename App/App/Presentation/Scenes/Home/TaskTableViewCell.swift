//
//  TaskTableViewCell.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/19/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import UIKit
import Domain

class TaskTableViewCell: UITableViewCell {
    static let identifier = "TaskTableViewCell"
    
    static func create(_ tableView: UITableView, indexPath: IndexPath) -> TaskTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TaskTableViewCell
    }

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindTo(task: TaskEntity) {
        titleLabel.text = task.title
        descriptionLabel.text = task.description
    }
}
