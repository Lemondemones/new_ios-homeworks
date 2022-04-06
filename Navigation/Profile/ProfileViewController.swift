//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configurateTableView()
    }
    
    func configurateTableView() {
        self.view.addSubview(profileTableView)
        setTableViewDelegate()
        setupConstrains()
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
        return tableView
    }()

    func setupConstrains() {
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
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell_identifier" , for: indexPath) as! PostTableViewCell
        cell.configuratePostTableViewCell(title: posts_array[indexPath.row].author,
                                          like: posts_array[indexPath.row].likes,
                                          views: posts_array[indexPath.row].views,
                                          description: posts_array[indexPath.row].description,
                                          image: posts_array[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView_indentifier") as! ProfileHeaderView
        return headerView
    }
        
}
