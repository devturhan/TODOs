//
//  LocalRealmService.swift
//  TODOs
//
//  Created by Omer Turhan on 8.05.2019.
//  Copyright © 2019 Omer Turhan. All rights reserved.
//

import Foundation
import RealmSwift

protocol LocalRealmServiceProtocol {
    func getRealm() throws -> Realm
}

extension LocalRealmServiceProtocol {
    func getRealm() throws -> Realm {
        return try Realm()
    }
}
