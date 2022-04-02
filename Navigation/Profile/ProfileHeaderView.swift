//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 19.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
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
        
        var BottomButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .systemBlue
            button.setTitle("New post", for: .normal)
            button.setTitleColor(.lightGray, for: .highlighted)
            return button
        }()
        
        func setupConstrains() {

            self.translatesAutoresizingMaskIntoConstraints = false
            guard let View = superview  else { return }

            NSLayoutConstraint.activate([

                self.leftAnchor.constraint(equalTo: View.safeAreaLayoutGuide.leftAnchor),
                self.rightAnchor.constraint(equalTo: View.safeAreaLayoutGuide.rightAnchor),
                self.topAnchor.constraint(equalTo: View.safeAreaLayoutGuide.topAnchor),
                self.heightAnchor.constraint(equalToConstant: 220),


                avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16),
                avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
                
                setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
                setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
                setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 42),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),
                
     
                statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
                statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -60),

                fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
                fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),

                statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 15),
                statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
                statusTextField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
                statusTextField.heightAnchor.constraint(equalToConstant: 40),
                
                BottomButton.leftAnchor.constraint(equalTo: View.leftAnchor),
                BottomButton.rightAnchor.constraint(equalTo: View.rightAnchor),
                BottomButton.heightAnchor.constraint(equalToConstant: 40),
                BottomButton.bottomAnchor.constraint(equalTo: View.safeAreaLayoutGuide.bottomAnchor)
            ])

            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
        
        func addView() {
            self.addSubview(avatarImageView)
            self.addSubview(fullNameLabel)
            self.addSubview(statusTextField)
            self.addSubview(statusLabel)
            self.addSubview(setStatusButton)
            self.addSubview(BottomButton)
            self.setupConstrains()
        }
        
        @objc func pressButton() {
            if statusLabel.text != nil {
            print(statusLabel.text!)
        }
    }
}



