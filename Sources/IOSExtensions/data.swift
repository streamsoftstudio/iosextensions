//
//  data.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

private enum CRC32 {
    static let table: [UInt32] = (0...255).map { i -> UInt32 in
        (0..<8).reduce(UInt32(i)) { c, _ in
            (c % 2 == 0) ? (c >> 1) : (0xEDB88320 ^ (c >> 1))
        }
    }

    static func checksum(bytes: [UInt8]) -> UInt32 {
        ~bytes.reduce(~UInt32(0)) { crc, byte in
            (crc >> 8) ^ table[(Int(crc) ^ Int(byte)) & 0xFF]
        }
    }
}

public extension Data {
    /// Uppercase hexadecimal string representation of the data's bytes.
    var hexadecimalString: String {
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

    /// The data represented as an array of bytes.
    var bytes: [UInt8] { [UInt8](self) }

    /// CRC-32 checksum of the data.
    var crc: UInt32 { CRC32.checksum(bytes: bytes) }

    /// The bytes from `index` to the end of the data.
    func bytes(from index: Int) -> [UInt8] {
        Array(bytes[index...])
    }

    /// Splits the data into consecutive chunks of at most `size` bytes.
    func chunks(into size: Int) -> [Data] {
        stride(from: 0, to: count, by: size).map {
            Data(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
