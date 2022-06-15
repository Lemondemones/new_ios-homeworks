//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 19.03.2022.
//

import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    var avatarImageView: UIImageView = {
            let image = UIImageView()
            image.clipsToBounds = true
            image.image = UIImage(named: "Avatar")
            image.layer.borderWidth = 3
            image.layer.cornerRadius = 50
            return image
        }()
        
        
        var fullNameLabel: UILabel = {
            let label = UILabel()
            label.text  = "Minus"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            return label
        }()
        
        
        
        var statusLabel: UILabel = {
            let statLabel = UILabel()
            statLabel.text = "Waiting for something"
            statLabel.textColor = .gray
            statLabel.font = UIFont.systemFont(ofSize: 15,weight: .regular)
            return statLabel
        }()
        
        
        var statusTextField: UITextField = {
            let statusTextField = UITextField()
            statusTextField.layer.borderWidth = 1
            statusTextField.layer.borderColor = UIColor.black.cgColor
            statusTextField.layer.cornerRadius = 12
            statusTextField.backgroundColor = .white
            statusTextField.textColor = .black
            statusTextField.placeholder = " Set status"
            statusTextField.textColor = .black
            statusTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)

            return statusTextField
        }()
        
        
        var setStatusButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowOpacity = 0.7
            button.layer.shadowRadius = 4
            button.setTitle("Show status", for: .normal)
            button.setTitleColor(.lightGray, for: .highlighted)
            button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
            return button
            
        }()
        
        var BottomButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("New post", for: .normal)
            button.setTitleColor(.lightGray, for: .highlighted)
            return button
        }()
    
        
        func setupLayout() {
        
            self.avatarImageView.snp.makeConstraints { (make) in
                make.topMargin.equalTo(20)
                make.leftMargin.equalTo(16)
                make.width.height.equalTo(100)
            }

            setStatusButton.snp.makeConstraints { (make) in
                make.topMargin.equalTo(avatarImageView.snp.bottom).offset(42)
                make.height.equalTo(50)
                make.leftMargin.equalTo(self.snp.left).offset(16)
                make.rightMargin.equalTo(self.snp.right).offset(-16)
            }

            statusLabel.snp.makeConstraints { (make) in
                make.leftMargin.equalTo(avatarImageView.snp.right).offset(20)
                make.topMargin.equalTo(avatarImageView.snp.bottom).offset(-60)
            }

            fullNameLabel.snp.makeConstraints { (make) in
                make.left.equalTo(avatarImageView.snp.right).offset(20)
                make.top.equalTo(self.snp.top).offset(30)
            }

            statusTextField.snp.makeConstraints { (make) in
                make.leftMargin.equalTo(avatarImageView.snp.right).offset(15)
                make.rightMargin.greaterThanOrEqualTo(self.snp.right).offset(-16)
                make.bottomMargin.equalTo(setStatusButton.snp.top).offset(-10)
                make.height.equalTo(40)
            }
        }
    
        func addViews() {
            contentView.addSubview(avatarImageView)
            contentView.addSubview(fullNameLabel)
            contentView.addSubview(statusTextField)
            contentView.addSubview(statusLabel)
            contentView.addSubview(setStatusButton)
            self.setupLayout()
        }
        
        @objc func pressButton() {
            if statusLabel.text != nil {
            print(statusLabel.text!)
        }
    }
    
    override init(reuseIdentifier: String?) {
             super.init(reuseIdentifier: reuseIdentifier)
             addViews()
        }

         required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
    }
}




