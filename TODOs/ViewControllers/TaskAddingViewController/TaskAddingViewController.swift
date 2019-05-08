//
//  TaskAddingViewController.swift
//  TODOs
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import UIKit

protocol TaskAddingViewControllerDelegate: class {
    func taskAddingViewControllerDismissed()
}

class TaskAddingViewController: BaseViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    
    var viewModel: TaskAddingViewModelProtocol!
    weak var delegate: TaskAddingViewControllerDelegate?
    
    static func instatiate (delegate: TaskAddingViewControllerDelegate) -> TaskAddingViewController {
        let vc: TaskAddingViewController = Storyboard.main.instantiateViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = delegate
        return vc
    }
    
    //MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel = TaskAddingViewModel()
    }
    
    //MARK: - IBActions
    @IBAction func saveButtonClicked(_ sender: Any) {
        let title = titleTextField.text ?? ""
        let detail = detailTextField.text ?? ""
        
        if title.trim().isEmpty {
            presentDefaultAlert(alert: EmptyTaskTitleDefaultAlert())
            return
        }
        
        do {
            try viewModel.saveTask(Task(title: title, detail: detail))
        }catch {
            presentDefaultAlert(alert: TaskSaveFailedDefaultAlert())
            return
        }
        
        dismiss()
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        dismiss()
    }
    
    func dismiss(){
        dismiss(animated: true) { [weak self] in
            self?.delegate?.taskAddingViewControllerDismissed()
        }
    }
    
}




