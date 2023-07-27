//
//  ViewController.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak private var cardsTableView: UITableView!
    
    var onNavigationBarButtonTap: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Картки"
        cardsTableView.delegate = self
        cardsTableView.dataSource = self
        
        configureToolbar()
    }
    
    private func configureToolbar() {
        var navBarButton: UIBarButtonItem?
        if let addButtonImage = UIImage(systemName: "plus") {
            navBarButton = UIBarButtonItem(image: addButtonImage,
                                           style: .plain,
                                           target: self,
                                           action: #selector(navigationBarButtonTapped))
        } else {
            navBarButton = UIBarButtonItem(title: "+",
                                           style: .plain,
                                           target: self,
                                           action: #selector(navigationBarButtonTapped))
        }
        navigationItem.rightBarButtonItem = navBarButton
    }
    
    
    @objc
    private func navigationBarButtonTapped() {
        onNavigationBarButtonTap?()
    }
    
}
