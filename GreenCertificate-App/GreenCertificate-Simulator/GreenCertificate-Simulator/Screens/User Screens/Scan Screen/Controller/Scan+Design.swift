//
//  Scan+Design.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import UIKit

extension ScanViewController {
    
    func setNavigationController() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
    }
    
    func setViews() {
        view.addSubview(scanView)
    }
    
    func setConstraints() {
        scanView.anchorToCenterY(left: view.leftAnchor,
                                 right: view.rightAnchor,
                                 leftConstant: 20,
                                 rightConstant: 20,
                                 heightConstant: 280,
                                 centerY: view.centerYAnchor)
    }
    
    func setButtonsMethods() {
        scanView.addAction(self, action: #selector(checkButtonAction))
        scanView.addScanAction(self, action: #selector(qrCodeButtonAction))
    }
    
}
