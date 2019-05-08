//
//  TaskAddingViewModel.swift
//  TODOs
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation

protocol TaskAddingViewModelProtocol:class {
    func saveTask(_ task: Task) throws
}

class TaskAddingViewModel: BaseViewModel, TaskAddingViewModelProtocol {
    let service: TasksLocalServiceProtocol! = LocalDataProvider.shared.tasksLocalService
    
    func saveTask(_ task: Task) throws {
        try service.saveTask(task)
    }
}
