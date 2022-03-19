//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    let header = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        self.view.addSubview(header)
        header.addView()
    }
}
