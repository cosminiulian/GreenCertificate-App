//
//  MessageViewController.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

class MessageViewController: UIViewController {
    
    lazy var messageView: MessageView = {
        let messageView = MessageView()
        messageView.layer.cornerRadius = 10
        messageView.backgroundColor = .cyan
        return messageView
    }()
    
    var message: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setViews()
        setConstraints()
        messageView.setText(string: message)
    }
    
}
