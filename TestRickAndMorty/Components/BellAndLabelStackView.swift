//
//  BellAndLabelStackView.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

class BellAndLabelStackView: UIView {
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    private lazy var bellImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bell")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 30 * coefHeight).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30 * coefWidth).isActive = true
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20 * coefHeight)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bellImageView, titleLabel])
        stack.axis = .horizontal
        stack.spacing = 20 * coefWidth
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        return stack
    }()
    
    private lazy var titleButton: UIButton = {
        let button = UIButton(configuration: .gray())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 20 * coefHeight)
        return button
    }() 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(color: UIColor, setLabelText: String, setButtonTitle: String) {
        bellImageView.tintColor = color
        titleLabel.text = setLabelText
        titleButton.setTitle(setButtonTitle, for: .normal)
        titleButton.tintColor = color
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        addSubview(stackView)
        addSubview(titleButton)
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20 * coefWidth),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                titleButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20 * coefHeight),
                titleButton.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                titleButton.heightAnchor.constraint(equalToConstant: 35 * coefHeight)
            ]
        )
    }
}
