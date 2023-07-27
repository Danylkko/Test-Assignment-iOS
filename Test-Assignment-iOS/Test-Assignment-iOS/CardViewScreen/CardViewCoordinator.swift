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
    var card: DebitCard
    
    init(card: DebitCard, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.card = card
    }
    
    func start() {
        let vc = CardViewController.instantiate()
        let vm = CardViewModel(card: card)
        vc.cardView = CardView(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        
    }
    
    
}
