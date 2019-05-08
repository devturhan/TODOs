//
//  ViewController.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import UIKit
import RealmSwift

class TasksViewController: BaseViewController {
    @IBOutlet weak var tasksTableView: UITableView!
    
    var viewModel: TasksViewModelProtocol!
    var tasksTableViewAdapter: TasksTableViewAdapter?
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasks"
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTasksToTableView()
    }
    
    func setupViewModel(){
        self.viewModel = TasksViewModel()
    }
    
    func loadTasksToTableView(){
        if let tasks = getTasks() {
            configureAdapter(tasks: tasks)
        }
    }
    
    func getTasks() -> Tasks? {
        do {
            let tasks = try viewModel.getTasks()
            return tasks
        } catch {
            presentErrorView()
        }
        return nil
    }
    
    func configureAdapter(tasks: Tasks){
        tasksTableViewAdapter = TasksTableViewAdapter(
            tableView: tasksTableView,
            dataSource: tasks,
            delegate: self)
    }
    
    //MARK: - IBActions
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let vc = TaskAddingViewController.instatiate(delegate: self)
        navigationController?.present(vc, animated: true, completion: nil)
    }
}


// MARK: - TasksTableViewAdapterDelegate
extension TasksViewController: TasksTableViewAdapterDelegate {
    func didSelect(task: Task) {
        let vc = TaskDetailViewController.instatiate(task: task)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didRemoved(task: Task) {
        do {
            try viewModel.removeTask(task)
        } catch {
            presentErrorView()
        }
    }
}

// MARK: - TaskAddingViewControllerDelegate
extension TasksViewController: TaskAddingViewControllerDelegate {
    func taskAddingViewControllerDismissed() {
        loadTasksToTableView()
    }
}
