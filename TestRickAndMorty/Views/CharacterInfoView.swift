//
//  CharacterInfoView.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

class CharacterInfoView: UIView {
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    private lazy var characterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var statusView: BellAndLabelStackView = {
        let view = BellAndLabelStackView()
        return view
    }()
    
    private lazy var genderView: BellAndLabelStackView = {
        let view = BellAndLabelStackView()
        return view
    }()
    
    private lazy var typeView: BellAndLabelStackView = {
        let view = BellAndLabelStackView()
        return view
    }()
    
    private lazy var speciesView: BellAndLabelStackView = {
        let view = BellAndLabelStackView()
        return view
    }()
    
    private lazy var firstStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [statusView, genderView])
        stack.axis = .horizontal
        stack.spacing = 5 * coefWidth
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var secondStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [typeView, speciesView])
        stack.axis = .horizontal
        stack.spacing = 5 * coefWidth
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var allStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstStack, secondStack])
        stack.axis = .vertical
        stack.spacing = 100 * coefHeight
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(character: Characters.Results?) {
        guard let character = character else { return }
        guard let url = URL(string: character.image ?? "") else { return }
        guard let type = character.type == "" ? "None" : character.type else { return }
        
        statusView.set(color: .systemBlue, setLabelText: character.status ?? "", setButtonTitle: "STATUS")
        genderView.set(color: .systemRed, setLabelText: character.gender ?? "", setButtonTitle: "GENDER")
        typeView.set(color: .systemPurple, setLabelText: type, setButtonTitle: "TYPE")
        speciesView.set(color: .systemGreen, setLabelText: character.species ?? "", setButtonTitle: "SPECIES")
        
        NetworkManager.shared.fetchImage(url: url, image: characterImageView)
    }
    
    private func setup() {
        backgroundColor = .white
    }
    
    private func setupViews() {
        addSubview(characterImageView)
        addSubview(allStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                characterImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                characterImageView.heightAnchor.constraint(equalToConstant: 300 * coefHeight),
                
                allStackView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 50 * coefHeight),
                allStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                allStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                allStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -50 * coefHeight)

                
//                statusView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 50 * coefHeight),
//                statusView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                statusView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.497),
//                statusView.heightAnchor.constraint(equalToConstant: 50 * coefHeight),
//                
//                genderView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 50 * coefHeight),
//                genderView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                genderView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.497),
//                genderView.heightAnchor.constraint(equalToConstant: 50 * coefHeight),
//
//                
//                typeView.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 100 * coefHeight),
//                typeView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                typeView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.497),
//                
//                speciesView.topAnchor.constraint(equalTo: genderView.bottomAnchor, constant: 100 * coefHeight),
//                speciesView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                speciesView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.497),
                
            ]
        )
    }
}
