//
//  Person.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

struct Person: Codable {
    
    let qrCode: String
    let firstName: String
    let lastName: String
    let email: String
    let birthDate: String
    let isCertificateExpired: Bool
}
