//
//  MainCoordinator.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    let rootViewContoller: UITabBarController
    
    var childCoordinator = [Coordinator]()
    
    init() {
        self.rootViewContoller = UITabBarController()
        rootViewContoller.tabBar.isTranslucent = true
        rootViewContoller.tabBar.backgroundColor = .white
    }
    
    func start() {
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        self.childCoordinator.append(firstCoordinator)
        let firstVC = firstCoordinator.rootViewController
        setup(vc: firstVC, title: "First", imageName: "paperplane", selectedImage: "paperplane")
        
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        self.childCoordinator.append(secondCoordinator)
        let secondVC = secondCoordinator.rootViewController
        setup(vc: secondVC, title: "Second", imageName: "bell", selectedImage: "bell.fill")
        
        self.rootViewContoller.viewControllers = [firstVC, secondVC]
        
    }
    
    func setup(vc: UIViewController, title: String, imageName: String, selectedImage: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImage)
        vc.tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
    }
}
