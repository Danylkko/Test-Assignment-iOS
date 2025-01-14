//
//  Coordinator.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func childDidFinish(_ child: Coordinator?)
}
