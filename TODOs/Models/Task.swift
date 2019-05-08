//
//  Task.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import RealmSwift

typealias Tasks = [Task]

class Task: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var createDate = Date()
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
    
    convenience init(title: String, detail: String) {
        self.init()
        self.title = title
        self.detail = detail
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
