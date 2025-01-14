//
//  CardViewModel.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation
import UIKit

class CardViewModel {
    
    private let card: DebitCard
    
    init(card: DebitCard) {
        self.card = card
    }
    
    var cardNumber: String {
        var masked = String()
        for _ in 0..<3 {
            masked.append("**** ")
        }
        let last4 = card.number.suffix(4)
        return masked + last4
    }
    
    var cardDate: Date {
        card.date
    }
    
    var bankName: String {
        "Bank"
    }
    
    var bankNameColor: UIColor {
        .white
    }
    
    var cardNumberColor: UIColor {
        switch card.brand {
        case .mastercard:
            return UIColor(hex: "#222222")
        case .visa:
            return UIColor(hex: "#faaa13")
        default:
            return .clear
        }
    }
    
    var brandLogo: UIImage? {
        switch card.brand {
        case .visa:
            return UIImage(named: "VisaBrandLogo")
        case .mastercard:
            return UIImage(named: "MastercardBrandLogo")
        case .none:
            return nil
        }
    }
    
    var cardColor: UIColor {
        switch card.brand {
        case .mastercard:
            return UIColor(hex: "#faaa13")
        case .visa:
            return UIColor(hex: "#222222")
        default:
            return .clear
        }
    }
}
