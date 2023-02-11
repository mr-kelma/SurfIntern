//
//  SceneDelegate.swift
//  SurfIntern
//
//  Created by Valery Keplin on 3.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        
        let backgroundViewController = BackgroundViewController()
        let navigationController = UINavigationController(rootViewController: backgroundViewController)
        window.rootViewController = navigationController
    }
}
