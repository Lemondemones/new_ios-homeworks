//
//  LoginInspector.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 30.06.2022.
//

import UIKit

class LoginInspector: LoginViewControllerDelegate {
    func check(login: String, pswd: String) -> Bool {
        let control = Cheker.shared.check(login: login, pswd: pswd)
        if control {
            print("Username correct")
            return true
        } else {
            print("Incorrect username")
            return false
        }
        
    }
}
