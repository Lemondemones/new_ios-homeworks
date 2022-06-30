//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 30.06.2022.
//

import UIKit

protocol LoginViewControllerDelegate {
    func check(login: String, pswd: String) -> Bool
}
