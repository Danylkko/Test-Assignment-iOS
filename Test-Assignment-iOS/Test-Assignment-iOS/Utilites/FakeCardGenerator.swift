//
//  FakeCardGenerator.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation

class FakeCardGenerator {
    
    static func generate() -> DebitCard {
        let number = generateCardNumber()
        return DebitCard(number: number, date: Date())
    }
    
    static func generateCardNumber() -> String {
        let types: [DebitCard.Brand] = [.visa, .mastercard]
        let randomType = types.randomElement()!
        return generateCardNumber(type: randomType)
    }
    
    static func generateCardNumber(type: DebitCard.Brand) -> String {
        let prefix: String
        let length: Int = 16
        
        switch type {
        case .visa:
            prefix = "4"
        case .mastercard:
            prefix = "5"
        }
        
        var cardNumber = prefix
        while cardNumber.count < length {
            cardNumber += "\(Int.random(in: 0...9))"
        }
        
        return cardNumber
    }
}
