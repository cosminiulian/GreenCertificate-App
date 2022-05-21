//
//  DetailsView.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 03.01.2022.
//

import UIKit

class DetailsView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.text = "First name:"
        return label
    }()
    
    lazy var firstNameContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.text = "Last name:"
        return label
    }()
    
    lazy var lastNameContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.text = "Email:"
        return label
    }()
    
    lazy var emailContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var birthDateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.text = "Birth date:"
        return label
    }()
    
    lazy var birthDateContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
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
        addSubview(titleLabel)
        addSubview(imageView)
        addSubview(firstNameLabel)
        addSubview(firstNameContentLabel)
        addSubview(lastNameLabel)
        addSubview(lastNameContentLabel)
        addSubview(emailLabel)
        addSubview(emailContentLabel)
        addSubview(birthDateLabel)
        addSubview(birthDateContentLabel)
    }
    
    private func setConstraints() {
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: imageView.leftAnchor,
                          topConstant: 40,
                          leftConstant: 20,
                          rightConstant: 5,
                          heightConstant: 32)
        
        imageView.anchor(top: topAnchor,
                         right: rightAnchor,
                         topConstant: 40,
                         rightConstant: 20,
                         widthConstant: 32,
                         heightConstant: 32)
        
        
        firstNameLabel.anchor(top: imageView.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              topConstant: 20,
                              leftConstant: 20,
                              rightConstant: 20,
                              heightConstant: 20)
        
        firstNameContentLabel.anchor(top: firstNameLabel.bottomAnchor,
                                     left: leftAnchor,
                                     right: rightAnchor,
                                     topConstant: 5,
                                     leftConstant: 20,
                                     rightConstant: 20,
                                     heightConstant: 20)
        
        lastNameLabel.anchor(top: firstNameContentLabel.bottomAnchor,
                             left: leftAnchor,
                             right: rightAnchor,
                             topConstant: 10,
                             leftConstant: 20,
                             rightConstant: 20,
                             heightConstant: 20)
        
        lastNameContentLabel.anchor(top: lastNameLabel.bottomAnchor,
                                    left: leftAnchor,
                                    right: rightAnchor,
                                    topConstant: 5,
                                    leftConstant: 20,
                                    rightConstant: 20,
                                    heightConstant: 20)
        
        emailLabel.anchor(top: lastNameContentLabel.bottomAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          topConstant: 10,
                          leftConstant: 20,
                          rightConstant: 20,
                          heightConstant: 20)
        
        emailContentLabel.anchor(top: emailLabel.bottomAnchor,
                                 left: leftAnchor,
                                 right: rightAnchor,
                                 topConstant: 5,
                                 leftConstant: 20,
                                 rightConstant: 20,
                                 heightConstant: 20)
        
        birthDateLabel.anchor(top: emailContentLabel.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              topConstant: 10,
                              leftConstant: 20,
                              rightConstant: 20,
                              heightConstant: 20)
        
        birthDateContentLabel.anchor(top: birthDateLabel.bottomAnchor,
                                     left: leftAnchor,
                                     right: rightAnchor,
                                     topConstant: 5,
                                     leftConstant: 20,
                                     rightConstant: 20,
                                     heightConstant: 20)
    }
    
    func setContent(_ person: Person) {
        firstNameContentLabel.text = person.firstName
        lastNameContentLabel.text = person.lastName
        emailContentLabel.text = person.email
        birthDateContentLabel.text = person.birthDate
        imageView.image = person.isCertificateExpired ? UIImage(named: "RedCircleImage") : UIImage(named: "GreenCircleImage")
        titleLabel.text = person.isCertificateExpired ? "Inactive" : "Active"
    }
    
}
