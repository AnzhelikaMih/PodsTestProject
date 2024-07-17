//
//  SceneDelegate.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator: RootCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        
        let navigationController: UINavigationController = UINavigationController()
        self.window?.rootViewController = navigationController
        self.rootCoordinator = RootCoordinator(router: AppRouter(rootController: navigationController))
        self.rootCoordinator?.start()
        self.window?.makeKeyAndVisible()
    }
}
