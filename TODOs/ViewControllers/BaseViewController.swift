//
//  BaseViewController.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func presentErrorView(){
        print("PRESENT ERROR VİEW")
    }
    
    func presentDefaultAlert(alert: DefaultAlertProtocol){
        let alertController = UIAlertController(
            title: alert.title,
            message: alert.message, preferredStyle: alert.prefferedStyle)
        
        alert.actions.forEach { (action) in
            alertController.addAction(action)
        }
        
        present(alertController, animated: true)
    }
}


