//
//  LocalDataProvider.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation

class LocalDataProvider {
    static let shared = LocalDataProvider()
    var tasksLocalService: TasksLocalServiceProtocol!
    
    private init(){
        self.tasksLocalService = TasksLocalService()
    }
}
