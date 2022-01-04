//
//  LoadingHUD.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

struct LoadingHUD {
  
  public static func show(_ viewController: UIViewController) {
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = .medium
    loadingIndicator.startAnimating()
    
    alert.view.addSubview(loadingIndicator)
    viewController.present(alert, animated: true)
  }
  
}
