//
//  CardViewController.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak private var cardViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func loadCardView(vm: CardViewModel) {
        let cardView = CardView()
        cardView.viewModel = vm
        cardView.frame = cardViewContainer.bounds
        cardViewContainer.addSubview(cardView)
    }

}
