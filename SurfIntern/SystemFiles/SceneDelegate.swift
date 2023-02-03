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
        
        window = UIWindow(windowScene: windowScene)
        let viewController = MainViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
