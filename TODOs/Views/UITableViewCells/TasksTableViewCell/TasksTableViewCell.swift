//
//  TasksTableViewCell.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import UIKit

struct TasksTableViewCellViewModel {
    let task: Task
}

class TasksTableViewCell: UITableViewCell {
    static let nibName = "TasksTableViewCell"
    static let reuseIdentifier = "TasksTableViewCell"
    
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    var viewModel: TasksTableViewCellViewModel?
    
    func configure(_ viewModel: TasksTableViewCellViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.task.title
    }
}
