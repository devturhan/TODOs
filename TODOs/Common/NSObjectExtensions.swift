//
//  NSObjectExtensions.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation

public extension NSObject {
    // MARK: - Static Properties
    @objc class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
