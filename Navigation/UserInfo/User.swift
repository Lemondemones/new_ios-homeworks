//
//  User.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 27.06.2022.
//

import Foundation
import UIKit

public class User {
    
    let userFullName: String?
    let userAvatar: UIImage?
    let userStatus: String?
    
    init(userFullName: String?, userAvatar: UIImage?, userStatus: String?) {
        self.userFullName = userFullName
        self.userAvatar = userAvatar
        self.userStatus = userStatus
    }
    
}
