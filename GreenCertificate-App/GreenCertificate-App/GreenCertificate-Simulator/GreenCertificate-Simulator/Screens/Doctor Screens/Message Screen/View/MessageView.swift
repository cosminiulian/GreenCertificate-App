//
//  MessageView.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 03.01.2022.
//

import UIKit

class MessageView: UIView {
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if superview != nil {
            setViews()
            setConstraints()
        }
    }
    
    private func setViews() {
        addSubview(messageLabel)
    }
    
    private func setConstraints() {
        messageLabel.anchor(top: topAnchor,
                            left: leftAnchor,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            topConstant: 40,
                            leftConstant: 20,
                            bottomConstant: 40,
                            rightConstant: 20)
    }
    
    func setText(string: String) {
        messageLabel.text = string
    }
    
}
