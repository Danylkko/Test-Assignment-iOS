//
//  CardViewCoordinator.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 28.07.2023.
//

import UIKit

class CardViewCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func childDidFinish(_ child: Coordinator?) {
        
    }
    
    
}
