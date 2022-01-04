//
//  Login+Events.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

extension LoginViewController {
    
    // Action for testing purpose
    @objc func loginButtonAction() {
        LoadingHUD.show(self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dismiss(animated: true)
            
            if self.loginView.emailTextField.text == "dr.user@mail.com"
                && self.loginView.passwordTextField.text == "12345" {
                
                self.navigationController?.pushViewController(CreateCertificateViewController(), animated: true)
                UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLoggedIn)
                UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isDoctor)
                
            } else if self.loginView.emailTextField.text == "user@mail.com"
                        && self.loginView.passwordTextField.text == "12345" {
                
                self.navigationController?.pushViewController(ScanViewController(), animated: true)
                UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLoggedIn)
                UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isDoctor)
            }
            
        }
        
    }
    
}
