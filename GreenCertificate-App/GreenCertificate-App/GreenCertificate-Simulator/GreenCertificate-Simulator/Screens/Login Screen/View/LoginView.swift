//
//  LoginView.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

class LoginView: UIView {
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Email:"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Email"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(20)
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Password:"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(20)
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font =  .boldSystemFont(ofSize: 18)
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 102/255, green: 205/255, blue: 170/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if superview != nil {
            setViews()
            setConstraints()
        }
    }
    
    private func setViews() {
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setConstraints() {
        emailLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          topConstant: 40,
                          leftConstant: 20,
                          rightConstant: 20,
                          heightConstant: 40)
        
        emailTextField.anchor(top: emailLabel.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              topConstant: 5,
                              leftConstant: 20,
                              rightConstant: 20,
                              heightConstant: 40)
        
        passwordLabel.anchor(top: emailTextField.bottomAnchor,
                             left: leftAnchor,
                             right: rightAnchor,
                             topConstant: 20,
                             leftConstant: 20,
                             rightConstant: 20,
                             heightConstant: 40)
        
        passwordTextField.anchor(top: passwordLabel.bottomAnchor,
                                 left: leftAnchor,
                                 right: rightAnchor,
                                 topConstant: 5,
                                 leftConstant: 20,
                                 rightConstant: 20,
                                 heightConstant: 40)
        
        loginButton.anchor(top: passwordTextField.bottomAnchor,
                           left: leftAnchor,
                           right: rightAnchor,
                           topConstant: 40,
                           leftConstant: 20,
                           rightConstant: 20,
                           heightConstant: 60)
    }
    
    func addAction(_ viewController: LoginViewController, action: Selector) {
        loginButton.addTarget(viewController, action: action, for: .touchUpInside)
    }
    
}
