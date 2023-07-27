//
//  CardTableViewCell.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    public static let reuseId = "CardCellId"
    
    var viewModel: CardViewModel?
    @IBOutlet weak var brandLogoView: UIImageView!
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
        brandLogoView.image = viewModel?.brandLogo
        cardNumberLabel.text = viewModel?.cardNumber
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
