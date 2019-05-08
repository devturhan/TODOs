//
//  DefaultAlertProtocol.swift
//  TODOs
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import UIKit

protocol DefaultAlertProtocol {
    var title: String { get }
    var actions: [UIAlertAction] { get }
    var message: String { get }
    var prefferedStyle: UIAlertController.Style { get }
}
