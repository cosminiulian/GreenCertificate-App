//
//  CreateCertificate+Events.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import UIKit

extension CreateCertificateViewController {
    
    @objc func createCertificateButtonAction() {
        if createCertificateView.isValid() {
            let person = Person(qrCode: createCertificateView.qrCodeLabel.text!,
                                firstName: createCertificateView.firstNameTextField.text!,
                                lastName: createCertificateView.lastNameTextField.text!,
                                email: createCertificateView.emailTextField.text!,
                                birthDate: createCertificateView.birthDateTextField.text!,
                                isCertificateExpired: false)
            createPersonRequest(person: person)
            
        } else {
            let alert = UIAlertController(title: "Invalid data!", message: "Please enter valid data.", preferredStyle: .alert)
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
    
    @objc func datePickerAction() {
        if let datePicker = createCertificateView.birthDateTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            createCertificateView.birthDateTextField.text = dateformatter.string(from: datePicker.date)
        }
        createCertificateView.birthDateTextField.resignFirstResponder()
    }
    
}
