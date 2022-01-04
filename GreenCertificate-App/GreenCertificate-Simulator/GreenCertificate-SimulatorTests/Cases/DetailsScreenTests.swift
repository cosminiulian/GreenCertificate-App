//
//  DetailsScreenTests.swift
//  GreenCertificate-SimulatorTests
//
//  Created by Cosmin Iulian on 04.01.2022.
//

import XCTest
@testable import GreenCertificate_Simulator

class DetailsScreenTests: XCTestCase {

    let detailsVC = DetailsViewController()
    
    func testLabels() {
        let firstNameLabel = detailsVC.detailsView.firstNameLabel
        XCTAssertEqual(firstNameLabel.text, "First name:")
        
        let lastNameLabel = detailsVC.detailsView.lastNameLabel
        XCTAssertEqual(lastNameLabel.text, "Last name:")
        
        let emailLabel = detailsVC.detailsView.emailLabel
        XCTAssertEqual(emailLabel.text, "Email:")
        
        let birthDateLabel = detailsVC.detailsView.birthDateLabel
        XCTAssertEqual(birthDateLabel.text, "Birth date:")
    }

}
