//
//  TasksViewModel.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import RealmSwift

protocol TasksViewModelProtocol {
    func getTasks() throws -> Tasks
    func saveTask(_ task: Task) throws
    func removeTask(_ task: Task) throws
}

class TasksViewModel:BaseViewModel, TasksViewModelProtocol {
    var tasksLocalService: TasksLocalServiceProtocol = LocalDataProvider.shared.tasksLocalService
    
    func getTasks() throws -> Tasks {
        return try tasksLocalService.getTasks()
    }
    
    func saveTask(_ task: Task) throws {
        try tasksLocalService.saveTask(task)
    }
    
    func removeTask(_ task: Task) throws {
        try tasksLocalService.removeTask(task)
    }
    
    
}
