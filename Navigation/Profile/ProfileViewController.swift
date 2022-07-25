//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 19.03.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    var userService: UserService
    var userInfo: String?
    
    init(userService: UserService, userInfo: String?) {
        self.userService = userService
        self.userInfo = userInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        self.view.backgroundColor = .white
        #else
        self.view.backgroundColor = .systemBlue
        #endif
        configurateTableView()
    }
    
    func configurateTableView() {
        self.view.addSubview(profileTableView)
        setTableViewDelegate()
        setupLayout()
    }
    
    func setTableViewDelegate() {
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
    
    var profileTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell_identifier" )
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView_indentifier")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        return tableView
    }()

    func setupLayout() {
        NSLayoutConstraint.activate([
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         ])
    }
}
    extension ProfileViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell_identifier" , for: indexPath) as! PostTableViewCell
        cell.configuratePostTableViewCell(title: posts_array[indexPath.row].author,
                                          like: posts_array[indexPath.row].likes,
                                          views: posts_array[indexPath.row].views,
                                          description: posts_array[indexPath.row].description,
                                          image: posts_array[indexPath.row].image)
        return cell
        }else {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            let gesture = UITapGestureRecognizer(target: self, action: #selector(arrowButtonAction))
            PhotosTableViewCell.arrowButton.addGestureRecognizer(gesture)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView_indentifier") as! ProfileHeaderView
        
        let currentUserService = userService.getUser(userName: userInfo!)
        headerView.fullNameLabel.text = currentUserService?.userFullName
        headerView.avatarImageView.image = currentUserService?.userAvatar
        headerView.statusLabel.text = currentUserService?.userStatus
        return headerView
    }
        
    @objc private func arrowButtonAction() {
        let photoVC = PhotosViewController()
        self.navigationController?.pushViewController(photoVC, animated: true)
    }
}

