//
//  uiview.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 4.10.2026.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    /// Hides or shows the view, setting `isHidden` only when it changes.
    ///
    /// A stack view counts each hiding of an arranged view made inside an
    /// animation, so hiding one that is already hidden there takes two
    /// showings to undo, and the view then shows where the stack still lays
    /// it out as hidden. Use this for an arranged view that can change while
    /// an animation runs, as in a table cell configured during one.
    func setHiddenIfNeeded(_ hidden: Bool) {
        if isHidden != hidden {
            isHidden = hidden
        }
    }
}
#endif
