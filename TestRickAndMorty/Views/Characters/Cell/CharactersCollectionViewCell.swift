//
//  CharactersCollectionViewCell.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var characterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }() 
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17 * coefHeight)
        label.textColor = .black
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [characterNameLabel, statusLabel])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupShadow() {
        backgroundColor = .white
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: -4, height: 4)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 3
        containerView.layer.masksToBounds = false
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(characterImageView)
        containerView.addSubview(stackView)
    }
    
    func configure(character: Characters.Results?) {
        guard let character = character else { return }
        guard let url = URL(string: character.image ?? "") else { return }
        
        characterNameLabel.text = character.name
        statusLabel.text = "Status: \(character.status ?? "")"
        
        NetworkManager.shared.fetchImage(url: url, image: characterImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * coefHeight),
                
                characterImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
                characterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                characterImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                characterImageView.heightAnchor.constraint(equalToConstant: 180 * coefHeight),
                
                stackView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 5 * coefHeight),
                stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5 * coefWidth),
                stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5 * coefWidth),
                stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5 * coefHeight)
            ]
        )
    }
    
    
}
