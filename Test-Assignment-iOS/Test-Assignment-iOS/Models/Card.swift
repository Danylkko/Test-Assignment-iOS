//
//  Card.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation

protocol Card: Codable {
    var number: String { get }
    var date: Date { get }
}
