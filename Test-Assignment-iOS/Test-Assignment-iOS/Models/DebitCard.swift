//
//  DebitCard.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation

struct DebitCard: Card {
    var number: String
    var date: Date
    
    var brand: Brand? {
        switch number.first {
        case "4":
            return .visa
        case "5":
            return .mastercard
        default:
            return nil
        }
    }
    
    enum Brand {
        case visa
        case mastercard
    }
}
