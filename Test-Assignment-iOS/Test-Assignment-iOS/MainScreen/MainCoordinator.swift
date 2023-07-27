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
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showCardDetail(card: DebitCard) {
        let vm = CardViewModel(card: card)
        let detailVC = CardViewController.instantiate()
        detailVC.cardView = CardView(viewModel: vm)
        navigationController.pushViewController(detailVC, animated: true)
    }
    
}
