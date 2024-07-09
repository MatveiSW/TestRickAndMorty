//
//  SceneDelegate.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit
import FirebaseCore
import FirebaseRemoteConfig

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        
        fetchRemoteConfig { needForceUpdate in
                    if needForceUpdate {
                        self.showUpdateScreen()
                    } else {
                        self.setupTabBarController()
                    }
                }
        
        let charactersVC = UINavigationController(rootViewController: CharactersViewController())
        let locationsVC = UINavigationController(rootViewController: LocationsViewController())
        let episodesVC = UINavigationController(rootViewController: EpisodesViewController())
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())
        
        charactersVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 0)
        locationsVC.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 1)
        episodesVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 2)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
        
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.backgroundColor = .systemGray6
        tabBarVC.viewControllers = [charactersVC, locationsVC, episodesVC, settingsVC]
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
    }
    
    func fetchRemoteConfig(completion: @escaping (Bool) -> Void) {
            let remoteConfig = RemoteConfig.remoteConfig()
            let settings = RemoteConfigSettings()
            settings.minimumFetchInterval = 0 
            remoteConfig.configSettings = settings

            remoteConfig.fetch { status, error in
                if status == .success {
                    remoteConfig.activate { _, _ in
                        let needForceUpdate = remoteConfig.configValue(forKey: "needForceUpdate").boolValue
                        completion(needForceUpdate)
                    }
                } else {
                    completion(false)
                }
            }
        }
        
        func showUpdateScreen() {
            DispatchQueue.main.async {
                let updateVC = UpdateViewController()
                self.window?.rootViewController = updateVC
            }
        }
        
        func setupTabBarController() {
            DispatchQueue.main.async {
                let charactersVC = UINavigationController(rootViewController: CharactersViewController())
                let locationsVC = UINavigationController(rootViewController: LocationsViewController())
                let episodesVC = UINavigationController(rootViewController: EpisodesViewController())
                let settingsVC = UINavigationController(rootViewController: SettingsViewController())
                
                charactersVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 0)
                locationsVC.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 1)
                episodesVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 2)
                settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
                
                let tabBarVC = UITabBarController()
                tabBarVC.tabBar.backgroundColor = .systemGray6
                tabBarVC.viewControllers = [charactersVC, locationsVC, episodesVC, settingsVC]
                
                self.window?.rootViewController = tabBarVC
            }
        }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    
}

