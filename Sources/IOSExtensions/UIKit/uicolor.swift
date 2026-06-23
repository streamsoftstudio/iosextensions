//
//  uicolor.swift
//  IOSExtensions
//
//  Created by Dusan Juranovic on 10.8.21..
//

#if canImport(UIKit)
import UIKit

public extension UIColor {
    /// Creates a color from a hex string such as `"#FF8800"` or `"FF8800CC"`
    /// (RGB or RGBA, with or without a leading `#`).
    ///
    /// Returns `nil` if the string isn't a valid 6- or 8-digit hex color.
    convenience init?(hex: String) {
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hex.hasPrefix("#") { hex.removeFirst() }

        guard hex.count == 6 || hex.count == 8,
              let value = UInt64(hex, radix: 16) else {
            return nil
        }

        let r, g, b, a: CGFloat
        if hex.count == 8 {
            r = CGFloat((value & 0xFF00_0000) >> 24) / 255
            g = CGFloat((value & 0x00FF_0000) >> 16) / 255
            b = CGFloat((value & 0x0000_FF00) >> 8) / 255
            a = CGFloat(value & 0x0000_00FF) / 255
        } else {
            r = CGFloat((value & 0xFF0000) >> 16) / 255
            g = CGFloat((value & 0x00FF00) >> 8) / 255
            b = CGFloat(value & 0x0000FF) / 255
            a = 1
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
#endif
