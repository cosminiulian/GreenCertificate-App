//
//  ScanViewController.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

class ScanViewController: UIViewController {
    
    lazy var scanView: ScanView = {
        let scanView = ScanView()
        scanView.layer.cornerRadius = 10
        scanView.backgroundColor = .cyan
        return scanView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setNavigationController()
        setViews()
        setConstraints()
        setButtonsMethods()
    }
    
    func getPersonRequest(qrCode: String) {
        NetworkManager.shared.getPerson(qrCode: qrCode) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let nextViewController = DetailsViewController()
                    
                    if let response = response as? PersonResponse {
                        nextViewController.person = response.person
                        self.navigationController?.pushViewController(nextViewController, animated: true)
                        
                    } else if let response = response as? MessageResponse {
                        let alert = UIAlertController(title: nil, message: response.message, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    }
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
