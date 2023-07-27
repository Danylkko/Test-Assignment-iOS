//
//  DataManager.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation
import KeychainSwift
import RxSwift

class DataManager {
    
    public static let shared = DataManager()
    private let keychain = KeychainSwift()
    private let key = "MyDebitCards"
    
    let output = PublishSubject<[DebitCard]>()
    let addRecord = PublishSubject<DebitCard>()
    let fetchRecords = PublishSubject<Void>()
    private var disposeBag = DisposeBag()
    
    init() {
        addRecord.subscribe(
            onNext: { [weak self] card in
                var cards = self?.retrieve()
                cards?.append(card)
                if let cards = cards {
                    self?.store(cards: cards)
                    self?.fetchRecords.onNext(())
                }
            }
        ).disposed(by: disposeBag)
        
        fetchRecords
            .compactMap { [weak self] in
                self?.retrieve()
            }
            .subscribe(
                onNext: { [weak self] cards in
                    self?.output.onNext(cards.sorted { $0.date > $1.date })
                })
            .disposed(by: disposeBag)
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
