//
//  Scan+Delegate.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 03.01.2022.
//

import Foundation

// MARK: - Custom Delegate for Scanner View Controller
extension ScanViewController: ScanBarcodeDelegate {
    
    func didScanBarcode(code: String) { // executed when didScanBarcode(code: String) is called in ScannerViewController
        scanView.qrCodeLabel.text = code
    }
}
