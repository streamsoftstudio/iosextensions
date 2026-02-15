//
//  view.swift
//  iOSExtensions
//
//  Created by Andrija Milovanovic on 26.8.21..
//

import Foundation
import UIKit

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
