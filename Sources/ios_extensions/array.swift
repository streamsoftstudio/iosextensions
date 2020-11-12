//
//  File.swift
//  
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation


extension Array where Element: Hashable {
    var uniques: Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
