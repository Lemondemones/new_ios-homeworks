//
//  LogInViewController.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 20.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: LoginViewControllerDelegate?
    
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
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()


    private var VkLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "VkLogo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private var username: UITextField = {
        let username = UITextField()
        username.translatesAutoresizingMaskIntoConstraints = false
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
        password.translatesAutoresizingMaskIntoConstraints = false
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
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return loginButton
    }()
    
    private var logStackView: UIStackView = {
        let logStackView = UIStackView()
        logStackView.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            VkLogo.widthAnchor.constraint(equalToConstant: 100),
            VkLogo.heightAnchor.constraint(equalToConstant: 100),
            VkLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            VkLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            logStackView.topAnchor.constraint(equalTo: VkLogo.bottomAnchor, constant: 120),
            logStackView.heightAnchor.constraint(equalToConstant: 100),
            logStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            loginButton.topAnchor.constraint(equalTo: logStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
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
        
        guard let pswd = password.text else {return}
        guard let login = username.text else {return}
        guard let delegate = delegate else {return}

        let rule = delegate.check(login: login, pswd: pswd)
        
        if rule {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: false)
        } else {
            let alert = UIAlertController(title: "Unknown login", message: "Please, enter correct user login", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true)
        }
        
//#if DEBUG
//        let service = TestUserService()
//        let rule = delegate?.check(login: username.text, pswd: password.text)
//#else
//        let service = CurrentUserService()
//        let rule = delegate?.check(login: username.text, pswd: password.text)
//#endif
//        // Check user login
//        if let user = service.getUser(login: loginField.text ?? "") {
//            let profileVC = ProfileViewController(user: user)
//            navigationController?.setViewControllers([profileVC], animated: true)
//        } else {
//            let alert = UIAlertController(title: "Unknown login", message: "Please, enter correct user login", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//            self.present(alert, animated: true)
//        }
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
