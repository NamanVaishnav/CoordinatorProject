//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import UIKit
import SwiftUI
import Combine

class ApplicationCoordinator: Coordinator {
    
    var window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window : UIWindow) {
        self.window = window
    }
    
    func start() {
        
        setupOnboardingValue()
        
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewContoller
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding{
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController//UIHostingController(rootView: ContetView())//ViewController()
                
            }
        }.store(in: &subscriptions)
    }
    
    func setupOnboardingValue() {
        // storing and loadinng of state/data
        
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) // default of false
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter({ $0 })
            .sink { value in
                UserDefaults.standard.setValue(value, forKey: key)
            }.store(in: &subscriptions)
    }
    
}
