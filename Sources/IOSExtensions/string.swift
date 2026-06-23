//
//  string.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

public extension String {
    /// `true` if the entire string is a single detectable link/URL.
    var isValidURL: Bool {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        let range = NSRange(startIndex..., in: self)
        guard let match = detector.firstMatch(in: self, options: [], range: range) else {
            return false
        }
        // It's a valid URL only if the match covers the whole string.
        return match.range == range
    }
}
