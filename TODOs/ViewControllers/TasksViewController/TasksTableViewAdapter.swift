//
//  TasksTableViewAdapter.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

//sourcery: AutoMockable
protocol TasksTableViewAdapterDelegate: class {
    func didRemoved(task: Task)
    func didSelect(task: Task)
}

class TasksTableViewAdapter : NSObject {
    weak var tableView: UITableView?
    weak var delegate: TasksTableViewAdapterDelegate?
    var dataSource: Tasks
    
    init(tableView: UITableView,
         dataSource: Tasks,
         delegate: TasksTableViewAdapterDelegate?) {
        self.tableView = tableView
        self.dataSource = dataSource
        self.delegate = delegate
        super.init()
        configureTableView()
        registerNibs()
    }
    
    private func configureTableView(){
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.tableFooterView = UIView()
    }
    
    private func registerNibs(){
        let bundle = Bundle(for: TasksTableViewCell.self)
        tableView?.register(UINib.init(nibName: TasksTableViewCell.nibName, bundle: bundle),
                            forCellReuseIdentifier: TasksTableViewCell.reuseIdentifier)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let adapter = object as? TasksTableViewAdapter else { return false }
        if adapter.dataSource == dataSource { return true }
        return false
    }
}

extension TasksTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removalTask = dataSource[indexPath.row]
            dataSource = dataSource.filter { $0.id != removalTask.id }
            delegate?.didRemoved(task: removalTask)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelect(task: dataSource[indexPath.row])
    }
    
}

extension TasksTableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: TasksTableViewCell.reuseIdentifier, for: indexPath)
            as? TasksTableViewCell else { fatalError("TableView deque failed on \(#file) \(#function)") }
        let task = dataSource[indexPath.row]
        let cellViewModel = TasksTableViewCellViewModel(task: task)
        cell.configure(cellViewModel)
        return cell
    }
}
