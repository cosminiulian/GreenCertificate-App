//
//  Details+Design.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 03.01.2022.
//

import UIKit

extension DetailsViewController {
    
    func setViews() {
        view.addSubview(detailsView)
    }
    
    func setConstraints() {
        detailsView.anchorToCenterY(left: view.leftAnchor,
                                    right: view.rightAnchor,
                                    leftConstant: 20,
                                    rightConstant: 20,
                                    heightConstant: 330,
                                    centerY: view.centerYAnchor)
    }
    
}
