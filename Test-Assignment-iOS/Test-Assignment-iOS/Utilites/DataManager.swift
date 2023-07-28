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
        do {
            let jsonString = try JSONCoder.encode(cards, encoding: .utf8)
            keychain.set(jsonString, forKey: key)
        } catch {
            if let error = error as? JSONCoder.Error {
                print(error.descripion)
            }
            print(error)
        }
    }
    
    func retrieve() -> [DebitCard] {
        do {
            guard let jsonString = keychain.get(key) else { return [] }
            let cards: [DebitCard] = try JSONCoder.decode(jsonString, encoding: .utf8)
            return cards
        } catch {
            if let error = error as? JSONCoder.Error {
                print(error.descripion)
            } else {
                print(error)
            }
            return []
        }
    }
}
