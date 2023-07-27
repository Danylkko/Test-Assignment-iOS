//
//  FakeCardNumberGenerator.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation

class FakeCardNumberGenerator {
    
    static func generate() -> String {
        let types: [DebitCard.Brand] = [.visa, .mastercard]
        let randomType = types.randomElement()!
        return generate(type: randomType)
    }
    
    static func generate(type: DebitCard.Brand) -> String {
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
