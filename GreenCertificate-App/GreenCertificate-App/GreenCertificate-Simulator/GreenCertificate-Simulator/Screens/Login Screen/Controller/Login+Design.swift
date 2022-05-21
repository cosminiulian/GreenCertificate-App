//
//  Login+Design.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

extension LoginViewController {
    
    func setNavigationController() {
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setViews() {
        view.addSubview(loginView)
    }
    
    func setConstraints() {
        loginView.anchorToCenterY(left: view.leftAnchor,
                                  right: view.rightAnchor,
                                  leftConstant: 20,
                                  rightConstant: 20,
                                  heightConstant: 360,
                                  centerY: view.centerYAnchor)
    }
    
    func setButtonsMethods() {
        loginView.addAction(self, action: #selector(loginButtonAction))
    }
    
}
