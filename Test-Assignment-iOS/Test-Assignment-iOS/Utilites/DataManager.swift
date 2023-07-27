//
//  DataManager.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation
import KeychainSwift
import Combine

class DataManager {
    
    public static let shared = DataManager()
    private let keychain = KeychainSwift()
    private let key = "MyDebitCards"
    
    let output = CurrentValueSubject<[DebitCard], Never>([])
    let addRecord = PassthroughSubject<DebitCard, Never>()
    let fetchRecords = PassthroughSubject<Void, Never>()
    private var cn = Set<AnyCancellable>()
    
    init() {
        addRecord
            .sink { [weak self] card in
                var cards = self?.retrieve()
                cards?.append(card)
                if let cards = cards {
                    self?.store(cards: cards)
                    self?.fetchRecords.send()
                }
            }.store(in: &cn)
        
        fetchRecords
            .compactMap { [weak self] in
                self?.retrieve()
            }
            .sink { [weak self] cards in
                self?.output.send(cards.sorted { $0.date > $1.date })
            }.store(in: &cn)
    }
    
    func store(cards: [DebitCard]) {
        if let jsonString = try? JSONCoder.encode(cards) {
            keychain.set(jsonString, forKey: key)
        }
    }
    
    func retrieve() -> [DebitCard] {
        if let jsonString = keychain.get(key),
           let cards: [DebitCard] = try? JSONCoder.decode(jsonString) {
            return cards
        }
        return []
    }
}
