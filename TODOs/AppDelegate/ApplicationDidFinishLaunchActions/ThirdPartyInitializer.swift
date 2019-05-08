//
//  ThirdPartyInitializer.swift
//  TODOs
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

class ThirdPartyInitializer: ApplicationDidFinishLaunchAction {
    func run() {
        IQKeyboardManager.shared.enable = true
    }
    
    
}
