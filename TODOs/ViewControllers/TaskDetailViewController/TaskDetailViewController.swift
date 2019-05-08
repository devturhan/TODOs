//
//  TaskDetailViewController.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import UIKit

class TaskDetailViewController: BaseViewController {
    //Injected Properties
    var task: Task!
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var detailTextView: UITextView!
    
    var viewModel: TaskDetailViewModelProtocol!
    
    static func instatiate (task: Task) -> TaskDetailViewController {
        let vc: TaskDetailViewController = Storyboard.main.instantiateViewController()
        vc.task = task
        return vc
    }
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task Detail"
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTextViews()
    }
    
    func setupViewModel(){
        viewModel = TaskDetailViewModel()
    }
    
    func configureTextViews(){
        titleTextView.text = task.title
        titleTextView.delegate = self
        detailTextView.text = task.detail
        detailTextView.delegate = self
    }
    
}

extension TaskDetailViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        do {
            if titleTextView == textView,
                titleTextView.text != task.title,
                !titleTextView.text.isEmpty {
                try viewModel.updateTaskTitle(task, title: textView.text)
            }else if detailTextView == textView, detailTextView.text != task.detail {
                try viewModel.updateTaskDetail(task, detail: textView.text)
            }
        }catch {
            presentErrorView()
        }
    }
}
