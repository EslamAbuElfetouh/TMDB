//
//  SceneDelegate.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 20/12/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let isUnitTestRun = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        guard let windowScene = scene as? UIWindowScene,
              !isUnitTestRun else { return }
        // Create the MovieListViewController
        let viewController = MovieListConfigurator.viewController()
        configureWindow(with: viewController, in: windowScene)
    }
    
    func configureWindow(with rootViewController: UIViewController, in windowScene: UIWindowScene) {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        // Set Navigation as hidden
        navigationController.navigationBar.isHidden = true
        // Create the UIWindow and set the MovieListViewController as the root view controller
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
