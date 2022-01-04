//
//  CreateCertificateViewController.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

class CreateCertificateViewController: UIViewController {
    
    var datePicker: UIDatePicker!
    
    lazy var createCertificateView: CreateCertificateView = {
        let createCertificateView = CreateCertificateView()
        createCertificateView.layer.cornerRadius = 10
        createCertificateView.backgroundColor = .cyan
        return createCertificateView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setNavigationController()
        setViews()
        setConstraints()
        setButtonsMethods()
    }
    
    func createPersonRequest(person: Person) {
        
        NetworkManager.shared.createPerson(person: person) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let nextViewController = MessageViewController()
                    nextViewController.message = response.message
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
                
            }
        }
    }
    
}
