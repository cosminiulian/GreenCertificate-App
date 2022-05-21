//
//  Message+Design.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 03.01.2022.
//

import UIKit

extension MessageViewController {
    
    func setViews() {
        view.addSubview(messageView)
    }
    
    func setConstraints() {
        messageView.anchorToCenterY(left: view.leftAnchor,
                                    right: view.rightAnchor,
                                    leftConstant: 20,
                                    rightConstant: 20,
                                    heightConstant: 200,
                                    centerY: view.centerYAnchor)
    }
    
}
