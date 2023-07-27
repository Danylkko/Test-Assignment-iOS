//
//  MainCoordinator+NavControllerDelegate.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 28.07.2023.
//

import Foundation
import UIKit

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        if let cardVC = fromViewController as? CardViewController {
            // We're popping a buy view controller; end its coordinator
            childDidFinish(cardVC.coordinator)
        }
    }
}
