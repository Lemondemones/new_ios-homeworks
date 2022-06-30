//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 27.06.2022.
//

import Foundation
import UIKit

class CurrentUserService: UserService {
    
    let userInfo = User(userFullName: "lemon", userAvatar: UIImage(named: "avatarUser"), userStatus: "SnapKit for IOS")
    
    func getUser(userName: String) -> User? {
        if userName == userInfo.userFullName {
            return userInfo
        }
        else {
            return nil
        }
    }
}
