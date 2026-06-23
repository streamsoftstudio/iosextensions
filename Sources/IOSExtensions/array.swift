//
//  array.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

public extension Array where Element: Hashable {
    /// Returns the array with duplicate elements removed, preserving the order
    /// of first appearance.
    func removingDuplicates() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }

    /// Removes duplicate elements in place, preserving the order of first
    /// appearance.
    mutating func removeDuplicates() {
        self = removingDuplicates()
    }
}
