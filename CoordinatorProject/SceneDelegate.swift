//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: ContetView())//ViewController()
        self.window = window
        window.makeKeyAndVisible()
    }

}

