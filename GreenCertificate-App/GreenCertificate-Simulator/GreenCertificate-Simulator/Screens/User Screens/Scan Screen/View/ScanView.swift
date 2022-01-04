//
//  ScanView.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import UIKit

class ScanView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Certificate scanner"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var qrCodeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = Constants.qrLabelDefaultText
        label.textColor = .darkGray
        return label
    }()
    
    lazy var qrCodeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "QRCodeImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = .white
        return button
    }()
    
    lazy var checkCertificateButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font =  .boldSystemFont(ofSize: 18)
        button.setTitle("Check Certificate", for: .normal)
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
        addSubview(titleLabel)
        addSubview(qrCodeLabel)
        addSubview(qrCodeButton)
        addSubview(checkCertificateButton)
    }
    
    private func setConstraints() {
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          topConstant: 40,
                          leftConstant: 20,
                          rightConstant: 20,
                          heightConstant: 40)
        
        
        qrCodeButton.anchor(top: titleLabel.bottomAnchor,
                            left: leftAnchor,
                            topConstant: 20,
                            leftConstant: 20,
                            widthConstant: 32,
                            heightConstant: 32)
        
        qrCodeLabel.anchor(top: titleLabel.bottomAnchor,
                           left: qrCodeButton.rightAnchor,
                           right: rightAnchor,
                           topConstant: 20,
                           leftConstant: 10,
                           rightConstant: 20,
                           heightConstant: 32)
        
        checkCertificateButton.anchor(top: qrCodeLabel.bottomAnchor,
                                      left: leftAnchor,
                                      right: rightAnchor,
                                      topConstant: 40,
                                      leftConstant: 20,
                                      rightConstant: 20,
                                      heightConstant: 60)
    }
    
    func addAction(_ viewController: ScanViewController, action: Selector) {
        checkCertificateButton.addTarget(viewController, action: action, for: .touchUpInside)
    }
    
    func addScanAction(_ viewController: ScanViewController, action: Selector) {
        qrCodeButton.addTarget(viewController, action: action, for: .touchUpInside)
        
    }
    
    func isValid() -> Bool {
        if qrCodeLabel.text == Constants.qrLabelDefaultText {
            return false
        }
        
        return true
    }
    
}
