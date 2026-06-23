//
//  uibutton.swift
//  IOSExtensions
//
//  Created by Dusan Juranovic on 10.8.21..
//

#if canImport(UIKit)
import UIKit

public extension UIButton {
    /// Sets a solid background color for a specific control state.
    /// - Parameters:
    ///   - color: The background color to use.
    ///   - state: The control state the color applies to.
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        clipsToBounds = true // maintain corner radius
        let image = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { context in
            color.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        }
        setBackgroundImage(image, for: state)
    }
}
#endif
