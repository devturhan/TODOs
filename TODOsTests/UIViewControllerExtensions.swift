//
//  UIViewControllerExtensions.swift
//  TODOsTests
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func becomeActive() {
        UIView.setAnimationsEnabled(false)
        UIApplication.shared.keyWindow?.rootViewController = self
        UIView.setAnimationsEnabled(true)
    }
}
