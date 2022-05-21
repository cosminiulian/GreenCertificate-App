//
//  DetailsViewController.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    lazy var detailsView: DetailsView = {
        let detailsView = DetailsView()
        detailsView.layer.cornerRadius = 10
        detailsView.backgroundColor = .cyan
        return detailsView
    }()
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setViews()
        setConstraints()
        detailsView.setContent(person)
    }

}
