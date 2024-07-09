//
//  CharactersViewController.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

class CharactersViewController: UIViewController {
    
    private let viewModel = CharacterViewModel()
    private var characters: Characters?
    private lazy var mainView = CharactersView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingNavBar()
    }
    
    private func setup() {
        settingNavBar()
        mainView.charactersCollectionView.delegate = self
        mainView.charactersCollectionView.dataSource = self
    }
    
    private func settingNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
    }
    
    private func getCharacters() {
        viewModel.getCharacters { characters in
            self.characters = characters
            self.mainView.charactersCollectionView.reloadData()
        }
    }
}

extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainView.charactersIdentifier, for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(character: characters?.results?[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharacterInfoViewController()
        vc.character = characters?.results?[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

