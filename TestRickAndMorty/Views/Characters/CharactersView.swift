//
//  CharactersView.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

class CharactersView: UIView {
    
    private let coefHeight = UIScreen.main.bounds.height.adjustSizeHeight()
    private let coefWidth = UIScreen.main.bounds.width.adjustSizeWidth()
    
    public let charactersIdentifier = "charactersIdentifier"
    
    public lazy var charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 172 * coefWidth, height: 250 * coefHeight)
        layout.minimumInteritemSpacing = 5 * coefWidth
        layout.minimumLineSpacing = 5 * coefHeight
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10 * coefWidth, bottom: 0, right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: charactersIdentifier)
        return collection
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
    
    private func setup() {
        backgroundColor = .white
    }
    
    private func setupViews() {
        addSubview(charactersCollectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                charactersCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                charactersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                charactersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10 * coefWidth),
                charactersCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            ]
        )
    }
}
