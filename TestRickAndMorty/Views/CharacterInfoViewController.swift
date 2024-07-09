//
//  CharacterInfoViewController.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

class CharacterInfoViewController: UIViewController {
    
    public var character: Characters.Results?
    
    private lazy var mainView = CharacterInfoView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func settingNavBar() {
        navigationItem.title = character?.name
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setup() {
        settingNavBar()
        mainView.configure(character: character)
    }
}
