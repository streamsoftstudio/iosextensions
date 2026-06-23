//
//  calayer.swift
//  IOSExtensions
//
//  Created by Dusan Juranovic on 10.8.21..
//

#if canImport(UIKit)
import UIKit

public extension CALayer {
    /// Adds a drop shadow to the layer.
    /// - Parameters:
    ///   - offset: The shadow offset.
    ///   - color: The shadow color.
    ///   - opacity: The shadow opacity (0...1).
    ///   - radius: The shadow blur radius.
    ///   - rasterize: When `true`, sets a rasterized shadow path for performance.
    func addShadow(offset: CGSize = CGSize(width: 0, height: 3),
                   color: CGColor = UIColor.black.cgColor,
                   opacity: Float = 0.2,
                   radius: CGFloat = 2,
                   rasterize: Bool = true) {
        masksToBounds = false
        shadowRadius = radius
        shadowColor = color
        shadowOpacity = opacity
        shadowOffset = offset

        if rasterize {
            shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
            shouldRasterize = true
            rasterizationScale = UIScreen.main.scale
        }
    }

    /// Masks the layer to the given rounded corners.
    func addCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.mask = mask
    }
}
#endif
