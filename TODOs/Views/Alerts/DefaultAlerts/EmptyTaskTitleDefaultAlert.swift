//
//  EmptyTaskTitleDefaultAlert.swift
//  TODOs
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import UIKit

class EmptyTaskTitleDefaultAlert: DefaultAlertProtocol {
    var title: String = "Error"
    var actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .cancel, handler: nil)]
    var message: String = "Task title cannot be empty"
    var prefferedStyle: UIAlertController.Style = .alert
}
