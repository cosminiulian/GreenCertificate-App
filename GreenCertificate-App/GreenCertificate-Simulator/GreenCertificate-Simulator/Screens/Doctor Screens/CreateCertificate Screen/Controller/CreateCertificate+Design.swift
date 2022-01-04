//
//  CreateCertificate+Design.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import UIKit

extension CreateCertificateViewController {
    
    func setNavigationController() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
    }
    
    func setViews() {
        view.addSubview(createCertificateView)
    }
    
    func setConstraints() {
        createCertificateView.anchorToCenterY(left: view.leftAnchor,
                                  right: view.rightAnchor,
                                  leftConstant: 20,
                                  rightConstant: 20,
                                  heightConstant: 460,
                                  centerY: view.centerYAnchor)
    }
    
    func setButtonsMethods() {
        createCertificateView.addCreateAction(self, action: #selector(createCertificateButtonAction))
        createCertificateView.addScanAction(self, action: #selector(qrCodeButtonAction))
        createCertificateView.birthDateTextField.setInputViewDatePicker(target: self, selector: #selector(datePickerAction))
    }
}
