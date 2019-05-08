//
//  TasksViewControllerTests.swift
//  TODOsTests
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

@testable import TODOs
import XCTest
import SwiftyMocky

class TasksViewControllerTests: XCTestCase {
    
    var sut: TasksViewController!
    var mockTaskLocalService = TasksLocalServiceProtocolMock()
    
    override func setUp() {
        super.setUp()
        LocalDataProvider.shared.tasksLocalService = mockTaskLocalService
        sut = Storyboard.main.instantiateViewController()
    }
    
    func test_configuredAdapter_whenBecomeActive(){
        let tasks = [Task(title: "1", detail: "1"),
                     Task(title: "1", detail: "1")]
        Given(mockTaskLocalService, .getTasks(willReturn: tasks))
        let expectedAdapter = TasksTableViewAdapter(tableView: UITableView(),
                                                    dataSource: tasks,
                                                    delegate: nil)
        
        sut.becomeActive()
        XCTAssert(expectedAdapter.isEqual(sut.tasksTableViewAdapter))
    }
    
    func test_removeTaskCall(){
        let task = Task(title: "1", detail: "1")
        Given(mockTaskLocalService, .getTasks(willReturn: [task]))
        sut.becomeActive()
        sut.didRemoved(task: task)
        Verify(mockTaskLocalService, .removeTask(.value(task)))
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
}
