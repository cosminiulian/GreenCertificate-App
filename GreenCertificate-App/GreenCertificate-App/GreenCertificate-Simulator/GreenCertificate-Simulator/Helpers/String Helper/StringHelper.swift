//
//  StringHelper.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 01.01.2022.
//

import UIKit

extension String {
    
    public func isValid() -> Bool {
        let selfWithWhitespaces = replacingOccurrences(of: " ", with: "")
        return selfWithWhitespaces.count > 0
    }
    
    public func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
}
