//
//  LogInViewController.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 20.03.2022.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(scrollView)
        addSubviews()
        setupConstrains()
        username.delegate = self
        password.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()


    private var VkLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "VkLogo")
        return logo
    }()
    
    private var username: UITextField = {
        let username = UITextField()
        username.placeholder = "Email or phone"
        username.textColor = .black
        username.layer.borderColor = UIColor.lightGray.cgColor
        username.layer.borderWidth = 0.5
        username.font = UIFont.systemFont(ofSize: 16)
        username.autocapitalizationType = .none
        username.leftViewMode = .always
        username.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: username.frame.height))
        username.returnKeyType = .done
        return username
    }()
    
    private var password: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.textColor = .black
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.font = UIFont.systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.returnKeyType = .done
        return password
    }()
    
    private var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.backgroundColor = .init(red: 0.28, green: 0.52, blue: 0.8, alpha: 1.00)
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return loginButton
    }()
    
    private var logStackView: UIStackView = {
        let logStackView = UIStackView()
        logStackView.axis = .vertical
        logStackView.backgroundColor = .systemGray6
        logStackView.layer.borderColor = UIColor.lightGray.cgColor
        logStackView.distribution = .fillProportionally
        logStackView.layer.cornerRadius = 10
        logStackView.layer.borderWidth = 0.5
        logStackView.clipsToBounds = true
        return logStackView
    }()

    func setupConstrains() {
        
        
        
        scrollView.snp.makeConstraints{ (make) in
            make.leading.equalTo(view.snp.leadingMargin)
            make.top.equalTo(view.snp.topMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
        
        contentView.snp.makeConstraints{ (make) in
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.centerX.equalTo(scrollView.snp.centerX)
            make.centerY.equalTo(scrollView.snp.centerY)
        }
        
        VkLogo.snp.makeConstraints{ (make) in
            make.width.height.equalTo(100)
            make.top.equalTo(contentView.snp.top).offset(120)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
        logStackView.snp.makeConstraints{ (make) in
            make.top.equalTo(VkLogo.snp.bottom).offset(120)
            make.height.equalTo(100)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        loginButton.snp.makeConstraints{ (make) in
            make.top.equalTo(logStackView.snp.bottom).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.height.equalTo(50)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == username {
            password.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
     }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    @objc func tap() {
        password.resignFirstResponder()
        username.resignFirstResponder()
    }

    @objc private func tapButton() {
        let profileVC = ProfileViewController()
        navigationController?.setViewControllers([profileVC], animated: true)
    }
    
    func addSubviews() {
        scrollView.addSubview(contentView)
        contentView.addSubview(VkLogo)
        contentView.addSubview(loginButton)
        contentView.addSubview(logStackView)
        logStackView.addArrangedSubview(username)
        logStackView.addArrangedSubview(password)
    }
}
