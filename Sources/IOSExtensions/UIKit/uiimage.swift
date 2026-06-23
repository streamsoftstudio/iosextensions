//
//  uiimage.swift
//  IOSExtensions
//
//  Created by Dusan Juranovic on 10.8.21..
//

#if canImport(UIKit)
import UIKit

public extension UIImage {
    /// Renders the given view (and its layer hierarchy) into an image.
    /// - Parameter view: The view to render.
    /// - Returns: The rendered image, or `nil` if `view` is `nil` or has a
    ///   zero-sized bounds.
    static func image(from view: UIView?) -> UIImage? {
        guard let view = view, view.bounds.size != .zero else { return nil }
        return UIGraphicsImageRenderer(bounds: view.bounds).image { context in
            view.layer.render(in: context.cgContext)
        }
    }
}
#endif
