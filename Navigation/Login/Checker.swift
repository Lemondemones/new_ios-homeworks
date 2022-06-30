//
//  Checker.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 30.06.2022.
//

import UIKit

class Cheker {
    private let login = "lemon"
    private let pswd = "1234"
    static let shared = Cheker()
    
    func check(login: String, pswd: String) -> Bool {
        if (login.hash == self.login.hash) && (pswd.hash == self.pswd.hash){
            return true
        } else {
            return false
        }
    }
}

