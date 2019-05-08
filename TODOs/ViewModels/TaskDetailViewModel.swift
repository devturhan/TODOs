//
//  TaskDetailViewModel.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation

protocol TaskDetailViewModelProtocol {
    func updateTaskTitle(_ task: Task, title: String) throws
    func updateTaskDetail(_ task: Task, detail: String) throws
}

class TaskDetailViewModel:BaseViewModel, TaskDetailViewModelProtocol {
    let service: TasksLocalServiceProtocol = LocalDataProvider.shared.tasksLocalService
    
    func updateTaskTitle(_ task: Task, title: String) throws {
        try service.updateTaskTitle(task, title: title)
    }
    
    func updateTaskDetail(_ task: Task, detail: String) throws {
        try service.updateTaskDetail(task, detail: detail)
    }
    
    
}
