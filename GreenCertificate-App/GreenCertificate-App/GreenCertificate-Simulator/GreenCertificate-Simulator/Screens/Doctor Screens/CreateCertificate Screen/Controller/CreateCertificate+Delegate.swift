//
//  CreateCertificate+Delegate.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import Foundation

// MARK: - Custom Delegate for Scanner View Controller
extension CreateCertificateViewController: ScanBarcodeDelegate {
    
    func didScanBarcode(code: String) { // executed when didScanBarcode(code: String) is called in ScannerViewController
       
        createCertificateView.qrCodeLabel.text = code
    }
}
