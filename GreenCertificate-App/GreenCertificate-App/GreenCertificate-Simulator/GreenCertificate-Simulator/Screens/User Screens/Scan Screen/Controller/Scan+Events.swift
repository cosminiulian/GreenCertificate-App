//
//  Scan+Events.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import UIKit

extension ScanViewController {
    
    @objc func checkButtonAction() {
        if scanView.isValid() {
            getPersonRequest(qrCode: scanView.qrCodeLabel.text!)
            
        } else {
            let alert = UIAlertController(title: "Invalid QR code!", message: "Please enter valid QR code.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    @objc func qrCodeButtonAction() {
        let vc = ScannerViewController()
        vc.scannerDelegate = self // set the scanDelegate property
        self.present(vc, animated: true)
    }
    
    @objc func logoutAction() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
        UserDefaults.standard.set(nil, forKey: UserDefaultsKeys.isLoggedIn)
        UserDefaults.standard.set(nil, forKey: UserDefaultsKeys.isDoctor)
    }
    
}
