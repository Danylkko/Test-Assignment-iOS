//
//  JSONCoder.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import Foundation

class JSONCoder {
    
    static func encode<T: Codable>(_ objects: [T], encoding: String.Encoding) throws -> String {
        let encoder = JSONEncoder()
        let data = try encoder.encode(objects)
        guard let jsonString = String(data: data, encoding: encoding) else {
            throw JSONCoder.Error.encodingError(encoding: encoding)
        }
        return jsonString
    }
    
    static func decode<T: Codable>(_ jsonString: String, encoding: String.Encoding) throws -> [T] {
        let decoder = JSONDecoder()
        guard let data = jsonString.data(using: encoding) else {
            throw JSONCoder.Error.decodingError(encoding: encoding)
        }
        let object = try decoder.decode([T].self, from: data)
        return object
    }
    
    enum Error: Swift.Error {
        case encodingError(encoding: String.Encoding)
        case decodingError(encoding: String.Encoding)
        
        var descripion: String {
            switch self {
            case .decodingError(let encoding):
                return "Encoding error occured while encoding data. Encoding: \(encoding)"
            case .encodingError(let encoding):
                return "Encoding error occured while decoding data. Encoding: \(encoding)"
            }
        }
    }
}
