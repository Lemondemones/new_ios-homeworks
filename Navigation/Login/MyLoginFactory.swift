//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 01.07.2022.
//

import UIKit

class MyLoginFactory: LoginFactory {
    func logInspector() -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
}
