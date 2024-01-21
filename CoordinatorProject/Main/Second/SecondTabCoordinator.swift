//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import UIKit

class SecondTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
