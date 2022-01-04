//
//  NetworkManager.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import Foundation
import UIKit

struct NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    // MARK:- GET REQUEST -> GET PERSON DETAILS
    func getPerson(qrCode: String, completed: @escaping (Result<Any, NSError>) -> Void) {
        
        guard let url = URL(string: URLs.getPerson + "?qrCode=\(qrCode)") else {
            completed(.failure(.init(domain: "", code: 0, userInfo:[NSLocalizedDescriptionKey: "Invaild url"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Error
            if let _ = error {
                completed(.failure(.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error task"])))
            }
            
            // Check if the response si valid
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                return
            }
            
            // Get data
            guard let data = data else {
                completed(.failure(.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid data"])))
                return
            }
            
            // Convert data using JSONDecoder
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let person = try decoder.decode(PersonResponse.self, from: data)
                completed(.success(person))
                
            } catch {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let message = try decoder.decode(MessageResponse.self, from: data)
                    completed(.success(message))
                    
                } catch {
                    print("Person & Message Model: Failed to Decode!")
                }
            }
            
        }
        
        task.resume() // execute the task
    }
    
    
    // MARK:- POST REQUEST -> CREATE PERSON
    func createPerson(person: Person, completed: @escaping (Result<MessageResponse, NSError>) -> Void) {
        
        guard let url = URL(string: URLs.createPerson) else {
            completed(.failure(.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invaild url"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        guard let jsonData = try? JSONEncoder().encode(person) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Error
            if let _ = error {
                completed(.failure(.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error task"])))
            }
            
            // Check if the response si valid
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                return
            }
            
            // Get Data
            guard let data = data else {
                completed(.failure(.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid data"])))
                return
            }
            
            // Convert data using JSONDecoder
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(MessageResponse.self, from: data)
                completed(.success(response))
                
            } catch {
                print("Person Model: Failed to Decode!")
            }
            
        }
        
        task.resume() // execute the task
    }
    
}
