//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 19.03.2022.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
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
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell_identifier" )
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView_indentifier")
        return tableView
    }()

    func setupLayout() {
        
        profileTableView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottomMargin)
            make.top.equalTo(view.snp.topMargin)
            make.trailing.equalTo(view.snp.trailing)
            make.leading.equalTo(view.snp.leading)
        }
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
