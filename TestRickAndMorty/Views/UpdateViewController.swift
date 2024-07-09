//
//  UpdateViewController.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 09.07.2024.
//

import UIKit

class UpdateViewController: UIViewController {
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    
    private lazy var updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE NOW", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(updateButton)
        
        NSLayoutConstraint.activate(
            [
                updateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * coefHeight),
                updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16 * coefWidth),
                updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16 * coefWidth),
                updateButton.heightAnchor.constraint(equalToConstant: 50 * coefHeight)
            ]
        )
    }
}
