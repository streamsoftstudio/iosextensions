//
//  view.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 26.8.21..
//

#if canImport(UIKit)
import UIKit

public extension UIWindow {
    /// `true` if the active foreground window scene's interface orientation is
    /// landscape.
    static var isLandscape: Bool {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first { $0.activationState == .foregroundActive }?
            .interfaceOrientation
            .isLandscape ?? false
    }
}
#endif
