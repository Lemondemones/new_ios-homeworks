//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 19.03.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    var avatarImageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.clipsToBounds = true
            image.image = UIImage(named: "Avatar")
            image.layer.borderWidth = 3
            image.layer.cornerRadius = 50
            return image
        }()
        
        
        var fullNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text  = "Minus"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            return label
        }()
        
        
        
        var statusLabel: UILabel = {
            let statLabel = UILabel()
            statLabel.translatesAutoresizingMaskIntoConstraints = false
            statLabel.text = "Waiting for something"
            statLabel.textColor = .gray
            statLabel.font = UIFont.systemFont(ofSize: 15,weight: .regular)
            return statLabel
        }()
        
        
        var statusTextField: UITextField = {
            let statusTextField = UITextField()
            statusTextField.translatesAutoresizingMaskIntoConstraints = false
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
            button.translatesAutoresizingMaskIntoConstraints = false
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
        
//        var BottomButton: UIButton = {
//            let button = UIButton()
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.backgroundColor = .systemBlue
//            button.setTitle("New post", for: .normal)
//            button.setTitleColor(.lightGray, for: .highlighted)
//            return button
//        }()
        
        func setupConstrains() {

            self.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([

                self.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
                self.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                contentView.heightAnchor.constraint(equalToConstant: 220),


                avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
                avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
                
                setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 42),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),
                
     
                statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -60),

                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),

                statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
                statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
                statusTextField.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -16),
                statusTextField.heightAnchor.constraint(equalToConstant: 40),

            ])
        }
    
        func addViews() {
            contentView.addSubview(avatarImageView)
            contentView.addSubview(fullNameLabel)
            contentView.addSubview(statusTextField)
            contentView.addSubview(statusLabel)
            contentView.addSubview(setStatusButton)
//            contentView.addSubview(BottomButton)
            setupConstrains()
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




