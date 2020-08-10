//
//  SecurityDataManager.swift
//  Therapy
//
//  Created by Ivan Myrza on 21/07/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import Locksmith

final class SecurityDataManager {
        
    public func save(username: String, password: String, userIdentity: String) {
        do {
            try Locksmith.saveData(data: ["username" : username, "password": password], forUserAccount: userIdentity)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}
