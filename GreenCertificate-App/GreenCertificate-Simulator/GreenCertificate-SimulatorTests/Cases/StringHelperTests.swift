//
//  StringHelperTests.swift
//  GreenCertificate-SimulatorTests
//
//  Created by Cosmin Iulian on 04.01.2022.
//

import XCTest
@testable import GreenCertificate_Simulator

class StringHelperTests: XCTestCase {

   func testEmailValidator() {
       let correctMailExample = "test@mail.com"
       XCTAssertEqual(correctMailExample.isEmailValid(), true)
       
       let wrongMailExample = "test.com"
       XCTAssertEqual(wrongMailExample.isEmailValid(), false)
    }
    
    func testValidator() {
        let correcExample = "test"
        XCTAssertEqual(correcExample.isValid(), true)
        
        let wrongExample = ""
        XCTAssertEqual(wrongExample.isValid(), false)
    }

}
