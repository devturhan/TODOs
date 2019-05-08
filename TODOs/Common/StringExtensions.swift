//
//  StringExtensions.swift
//  TODOs
//
//  Created by Ömer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
extension String {
    func trim () -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
