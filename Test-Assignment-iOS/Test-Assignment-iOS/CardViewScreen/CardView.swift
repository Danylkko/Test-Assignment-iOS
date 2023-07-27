//
//  CardView.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class CardView: UIView {
    
    var viewModel: CardViewModel?

    override func draw(_ rect: CGRect) {
        // Drawing code
        bankNameLabel.text = viewModel?.bankName
        cardNumberLabel.text = viewModel?.cardNumber
        brandLogoView.image = viewModel?.brandLogo
    }
    
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var brandLogoView: UIImageView!
    
}
