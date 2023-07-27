//
//  CardViewController.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class CardViewController: UIViewController, Storyboarded {
    
    weak var coordinator: CardViewCoordinator?
    
    @IBOutlet weak private var cardViewContainer: UIView!
    var cardView: CardView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cardView = cardView {
            cardView.frame = cardViewContainer.bounds
            cardView.layoutIfNeeded()
            cardViewContainer.addSubview(cardView)
        }
    }
    
}
