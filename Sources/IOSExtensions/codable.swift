//
//  codable.swift
//  iOSExtensions
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

public extension Dictionary
{
    func fromDictionary<T:Decodable>() -> T?
    {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: .fragmentsAllowed) {
            return try? JSONDecoder().decode(T.self, from: data)
        }
        return nil
    }
}
public extension Encodable
{
    var dictionary: [String: Any]?
    {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
}


public extension Decodable {
    
    static func decoded(str: String) -> Self? {
        if let data =  str.data(using: .utf8)  {
            return try? Self.decode(data:data)
        }
        return nil
    }
    
    static func decode(data: Data) throws -> Self? {
        return try? JSONDecoder().decode(Self.self, from: data)
    }
}
public extension Encodable {
    var encoded:String? {
        if let e = try? JSONEncoder().encode(self), let val = String(data:e, encoding: .utf8) {
            return val
        }
        return nil
    }
    func encode() throws -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
