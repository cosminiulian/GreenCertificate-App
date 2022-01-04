//
//  LoginViewController.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginView: LoginView = {
        loginView = LoginView()
        loginView.layer.cornerRadius = 10
        loginView.backgroundColor = .cyan
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setNavigationController()
        setViews()
        setConstraints()
        setButtonsMethods()
        autocompleteFields()
    }
    
    func autocompleteFields() {
        loginView.emailTextField.text = "dr.user@mail.com"
        // loginView.emailTextField.text = "user@mail.com"
        loginView.passwordTextField.text = "12345"
    }
    
}
