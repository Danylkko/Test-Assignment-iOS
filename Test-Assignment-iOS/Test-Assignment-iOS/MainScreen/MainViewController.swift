//
//  ViewController.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit
import Combine

class MainViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak private var cardsTableView: UITableView!
    private(set) var cards = [DebitCard]()
    
    var onNavigationBarButtonTap: (() -> Void)?
    
    private var cn = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Картки"
        cardsTableView.delegate = self
        cardsTableView.dataSource = self
        let nib = UINib(nibName: "CardTableViewCell", bundle: nil)
        cardsTableView.register(nib, forCellReuseIdentifier: CardTableViewCell.reuseId)
        
        configureToolbar()
        DataManager
            .shared
            .output
            .sink { [weak self] cards in
                self?.cards = cards
                self?.cardsTableView.reloadData()
            }.store(in: &cn)
        DataManager.shared.fetchRecords.send()
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
        let fakeCard = FakeCardGenerator.generate()
        DataManager.shared
            .addRecord.send(fakeCard)
    }
    
}
