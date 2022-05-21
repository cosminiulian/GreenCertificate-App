//
//  CreateCertificateView.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import UIKit

class CreateCertificateView: UIView {
    
    lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "First name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(20)
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Last name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(20)
        textField.addDoneButtonOnKeyboard()
        return textField
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
    
    lazy var birthDateTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Birth date"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(20)
        return textField
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
    
    lazy var createCertificateButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font =  .boldSystemFont(ofSize: 18)
        button.setTitle("Create Certificate", for: .normal)
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
        addSubview(firstNameTextField)
        addSubview(lastNameTextField)
        addSubview(emailTextField)
        addSubview(birthDateTextField)
        addSubview(qrCodeLabel)
        addSubview(qrCodeButton)
        addSubview(createCertificateButton)
    }
    
    private func setConstraints() {
        firstNameTextField.anchor(top: topAnchor,
                                  left: leftAnchor,
                                  right: rightAnchor,
                                  topConstant: 40,
                                  leftConstant: 20,
                                  rightConstant: 20,
                                  heightConstant: 40)
        
        lastNameTextField.anchor(top: firstNameTextField.bottomAnchor,
                                 left: leftAnchor,
                                 right: rightAnchor,
                                 topConstant: 20,
                                 leftConstant: 20,
                                 rightConstant: 20,
                                 heightConstant: 40)
        
        emailTextField.anchor(top: lastNameTextField.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              topConstant: 20,
                              leftConstant: 20,
                              rightConstant: 20,
                              heightConstant: 40)
        
        birthDateTextField.anchor(top: emailTextField.bottomAnchor,
                                  left: leftAnchor,
                                  right: rightAnchor,
                                  topConstant: 20,
                                  leftConstant: 20,
                                  rightConstant: 20,
                                  heightConstant: 40)
        
        qrCodeButton.anchor(top: birthDateTextField.bottomAnchor,
                            left: leftAnchor,
                            topConstant: 20,
                            leftConstant: 20,
                            widthConstant: 32,
                            heightConstant: 32)
        
        qrCodeLabel.anchor(top: birthDateTextField.bottomAnchor,
                           left: qrCodeButton.rightAnchor,
                           right: rightAnchor,
                           topConstant: 20,
                           leftConstant: 10,
                           rightConstant: 20,
                           heightConstant: 32)
        
        createCertificateButton.anchor(top: qrCodeLabel.bottomAnchor,
                                       left: leftAnchor,
                                       right: rightAnchor,
                                       topConstant: 40,
                                       leftConstant: 20,
                                       rightConstant: 20,
                                       heightConstant: 60)
    }
    
    func addCreateAction(_ viewController: CreateCertificateViewController, action: Selector) {
        createCertificateButton.addTarget(viewController, action: action, for: .touchUpInside)
    }
    
    func addScanAction(_ viewController: CreateCertificateViewController, action: Selector) {
        qrCodeButton.addTarget(viewController, action: action, for: .touchUpInside)
    }
    
    func isValid() -> Bool {
        if qrCodeLabel.text == Constants.qrLabelDefaultText {
            return false
        }
        if firstNameTextField.text?.isValid() == false {
            return false
        }
        if lastNameTextField.text?.isValid() == false {
            return false
        }
        if emailTextField.text?.isEmailValid() == false {
            return false
        }
        if birthDateTextField.text?.isValid() == false {
            return false
        }
        
        return true
    }
    
}
