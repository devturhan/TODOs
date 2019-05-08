//
//  TaskDetailViewControllerTests.swift
//  TODOsTests
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//
@testable import TODOs
import XCTest
import SwiftyMocky

class TaskDetailViewControllerTests: XCTestCase {

    var sut: TaskDetailViewController!
    var mockTaskLocalService = TasksLocalServiceProtocolMock()
    
    override func setUp() {
        super.setUp()
        LocalDataProvider.shared.tasksLocalService = mockTaskLocalService
    }
    
    func test_textViewsConfiguration_WhenActive(){
        let task = Task(title: "Title", detail: "Detail")
        sut = TaskDetailViewController.instatiate(task: task)
        sut.becomeActive()
        XCTAssert(sut.titleTextView.text == task.title)
        XCTAssert(sut.detailTextView.text == task.detail)
    }
    
    func test_textViewDidEndEditing_detail(){
        let task = Task(title: "Title", detail: "Detail")
        let newDetail = "NewDetail"
        sut = TaskDetailViewController.instatiate(task: task)
        sut.becomeActive()
        sut.detailTextView.text = newDetail
        sut.textViewDidEndEditing(sut.detailTextView)
        Verify(mockTaskLocalService, .updateTaskDetail(
            Parameter<Task>.value(task),
            detail: Parameter<String>.value(newDetail)))
    }
    
    func test_textViewDidEndEditing_title(){
        let task = Task(title: "Title", detail: "Detail")
        let title = "NewTitle"
        sut = TaskDetailViewController.instatiate(task: task)
        sut.becomeActive()
        sut.titleTextView.text = title
        sut.textViewDidEndEditing(sut.titleTextView)
        Verify(mockTaskLocalService,
               .updateTaskTitle(Parameter<Task>.value(task),
                                title: Parameter<String>.value(title)))
    }
    
    
}
