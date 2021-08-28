//
//  uiimage.swift
//  iOSExtensions
//
//  Created by Dusan Juranovic on 10.8.21..
//

import UIKit

public extension UIImage {
	/// Create an optional `UIImage` from a `UIView`.
	/// - Parameter view: `UIView` to be turned into an image.
	/// - Returns: `UIImage?`
	static func createImageFrom(_ view:UIView?) -> UIImage? {
		guard let view = view , view.bounds.size != .zero else {
			fatalError("The UIView is either nil or has frame of CGSize.zero")
		}
		
		UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
		view.layer.render(in: UIGraphicsGetCurrentContext()!)
		let img = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return img
	}
}

