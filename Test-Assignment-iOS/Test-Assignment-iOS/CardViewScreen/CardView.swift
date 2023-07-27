//
//  CardView.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

class CardView: UIView {
    
    var viewModel: CardViewModel?
    
    init(viewModel: CardViewModel? = nil) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @discardableResult
    private func loadNib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("CardView", owner: self)?.first as? UIView else {
            fatalError("Cannot load CardView nib")
        }
        view.frame = bounds
        addSubview(view)
        return view
    }
    
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
