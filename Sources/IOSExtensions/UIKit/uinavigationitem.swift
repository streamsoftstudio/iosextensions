//
//  uinavigationitem.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 4.10.2026.
//

#if canImport(UIKit)
import UIKit

public extension UINavigationItem {
    /// Lets the screen's content show through its navigation bar, which
    /// keeps only its buttons, as over a large cover. It changes this screen
    /// alone, whatever the bar's appearance elsewhere.
    func makeBarTransparent() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }
}
#endif
