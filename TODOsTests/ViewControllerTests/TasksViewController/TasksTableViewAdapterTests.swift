//
//  TasksTableViewAdapterTests.swift
//  TODOsTests
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

@testable import TODOs
import XCTest
import SwiftyMocky

class TasksTableViewAdapterTests: XCTestCase {

    var sut: TasksTableViewAdapter!
    
    func test_didSelect_TriggerDelegate(){
        let task = Task(title: "Hi", detail: "")
        let mockDelegate = TasksTableViewAdapterDelegateMock()
        let tableView = UITableView()
        sut = TasksTableViewAdapter.init(tableView: tableView,
                                         dataSource: [task],
                                         delegate: mockDelegate)
        
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        Verify(mockDelegate, .didSelect(task: Parameter<Task>.value(task)))
    }
    
    func test_delete_TriggerDelegate(){
        let task = Task(title: "Hi", detail: "")
        let mockDelegate = TasksTableViewAdapterDelegateMock()
        let tableView = UITableView()
        sut = TasksTableViewAdapter.init(tableView: tableView,
                                         dataSource: [task],
                                         delegate: mockDelegate)
        
        sut.tableView(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 0))
        Verify(mockDelegate, .didRemoved(task: Parameter<Task>.value(task)))
    }
    
    func test_cellForRowAt_cellConfiguration(){
        let task = Task(title: "Hi", detail: "Hello")
        let tableView = UITableView()
        sut = TasksTableViewAdapter.init(tableView: tableView,
                                         dataSource: [task],
                                         delegate: nil)
        if let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TasksTableViewCell {
            XCTAssert(cell.titleLabel.text == task.title)
            return
        }
        
        XCTFail("\(#function) Failed")
    }

}
