//
//  TestUserService.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 27.06.2022.
//

import Foundation
import UIKit

class TestUserService: UserService {
    
    let userInfo = User(userFullName: "demon", userAvatar: UIImage(named: "test"), userStatus: "Test Status")
    
    func getUser(userName: String) -> User? {
        if userName == userInfo.userFullName {
            return userInfo
        }
        else {
            return nil
        }
    }
}
