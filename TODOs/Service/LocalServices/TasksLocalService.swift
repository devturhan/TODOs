//
//  TasksLocalService.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import RealmSwift

//sourcery: AutoMockable
protocol TasksLocalServiceProtocol: class {
    func saveTask(_ task: Task) throws
    func getTasks() throws -> [Task]
    func removeTask(_ task: Task) throws
    func updateTaskTitle(_ task: Task, title: String) throws
    func updateTaskDetail(_ task: Task, detail: String) throws
}

class TasksLocalService: TasksLocalServiceProtocol, LocalRealmServiceProtocol {
    
    func saveTask(_ task: Task) throws {
        let realm = try getRealm()
        try realm.write {
            realm.add(task, update: true)
        }
    }
    
    func getTasks() throws -> [Task] {
        let realm = try getRealm()
        return Array(realm.objects(Task.self))
    }
    
    func removeTask(_ task: Task) throws {
        let realm = try getRealm()
        try realm.write {
            realm.delete(task)
        }
    }
    
    func updateTaskTitle(_ task: Task, title: String) throws{
        let realm = try getRealm()
        try realm.write {
            task.title = title
        }
    }
    
    func updateTaskDetail(_ task: Task, detail: String) throws {
        let realm = try getRealm()
        try realm.write {
            task.detail = detail
        }
    }
    
}


