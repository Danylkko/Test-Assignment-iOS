//
//  MainCoordinator.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    func childDidFinish(_ child: Coordinator?) {
        
    }
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        
        vc.onNavigationBarButtonTap = { [weak self] in
            
        }
        
        navigationController.pushViewController(vc, animated: false)
    }
    
}
