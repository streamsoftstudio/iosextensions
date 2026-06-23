//
//  codable.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

public extension Encodable {
    /// A `[String: Any]` dictionary representation of the value, or `nil` if
    /// encoding fails.
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
    }

    /// JSON string representation of the value, or `nil` if encoding fails.
    var jsonString: String? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    /// Encodes the value to JSON `Data`, throwing if encoding fails.
    func encodedJSON(using encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        try encoder.encode(self)
    }
}

public extension Decodable {
    /// Decodes a value from JSON `Data`, throwing if decoding fails.
    static func decoded(from data: Data, using decoder: JSONDecoder = JSONDecoder()) throws -> Self {
        try decoder.decode(Self.self, from: data)
    }

    /// Decodes a value from a JSON string, or `nil` if it can't be decoded.
    static func decoded(from string: String) -> Self? {
        guard let data = string.data(using: .utf8) else { return nil }
        return try? decoded(from: data)
    }
}

public extension Dictionary {
    /// Decodes the dictionary into a `Decodable` value, or `nil` on failure.
    func decoded<T: Decodable>(as type: T.Type = T.self) -> T? {
        guard let data = try? JSONSerialization.data(withJSONObject: self) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
