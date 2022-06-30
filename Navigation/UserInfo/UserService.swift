//
//  UserService.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 27.06.2022.
//

import Foundation
import UIKit

protocol UserService {
    
    func getUser(userName: String) -> User?
    
}
