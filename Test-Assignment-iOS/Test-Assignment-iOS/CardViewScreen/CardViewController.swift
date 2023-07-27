//
//  CardViewController.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak private var cardViewContainer: UIView!
    var cardView: CardView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cardView = cardView {
            cardView.frame = cardViewContainer.bounds
            cardViewContainer.addSubview(cardView)
        }
    }
    
}
