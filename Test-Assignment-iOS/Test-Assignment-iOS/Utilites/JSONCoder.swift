//
//  JSONCoder.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation

class JSONCoder {
    
    static func encode<T: Codable>(_ objects: [T]) throws -> String {
        let encoder = JSONEncoder()
        let data = try encoder.encode(objects)
        guard let jsonString = String(data: data, encoding: .utf8) else {
            // TODO: - make prettier
            fatalError()
        }
        return jsonString
    }
    
    static func decode<T: Codable>(_ jsonString: String) throws -> [T] {
        let decoder = JSONDecoder()
        guard let data = jsonString.data(using: .utf8) else {
            // TODO: - make prettier
            fatalError()
        }
        let object = try decoder.decode([T].self, from: data)
        return object
    }
}
