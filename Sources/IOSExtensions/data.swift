//
//  File.swift
//  
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

fileprivate class CRC32
{
        
    static var table: [UInt32] = {
        (0...255).map { i -> UInt32 in
            (0..<8).reduce(UInt32(i), { c, _ in
                (c % 2 == 0) ? (c >> 1) : (0xEDB88320 ^ (c >> 1))
            })
        }
    }()

    static func checksum(bytes: [UInt8]) -> UInt32 {
        return ~(bytes.reduce(~UInt32(0), { crc, byte in
            (crc >> 8) ^ table[(Int(crc) ^ Int(byte)) & 0xFF]
        }))
    }
}

public extension Data
{
    // NOTE: Fastest implementation
    public var hexadecimalString:String {
        let hexDigits = Array("0123456789ABCDEF".utf16)
        var hexChars = [UTF16.CodeUnit]()
        hexChars.reserveCapacity(count * 2)

        for byte in self {
            let (index1, index2) = Int(byte).quotientAndRemainder(dividingBy: 16)
            hexChars.append(hexDigits[index1])
            hexChars.append(hexDigits[index2])
        }

        return String(utf16CodeUnits: hexChars, count: hexChars.count)
    }
}
    
public extension Data
{
    public var bytes: [UInt8] {
        var byteArray = [UInt8](repeating: 0, count: self.count)
        self.copyBytes(to: &byteArray, count: self.count)
        return byteArray
    }
    public func bytes(from index:Int) -> Array<UInt8> {
        return Array(self.bytes[index...])
    }
    public var crc:UInt32 {
        return CRC32.checksum(bytes:self.bytes)
    }
    public func chunks(into size: Int) -> [Data] {
        return stride(from: 0, to: count, by: size).map {
            Data(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
