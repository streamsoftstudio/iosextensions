//
//  uibutton.swift
//  iOSExtensions
//
//  Created by Dusan Juranovic on 10.8.21..
//

import UIKit

public extension UIButton {
	/// Sets background color for a specific UIButton  state
	/// - Parameters:
	///   - color: Background color
	///   - forState: UIButton state
	func setBackgroundColor(color: UIColor, forState: UIControl.State) {
		self.clipsToBounds = true  // add this to maintain corner radius
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
		if let context = UIGraphicsGetCurrentContext() {
			context.setFillColor(color.cgColor)
			context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
			let colorImage = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			self.setBackgroundImage(colorImage, for: forState)
		}
	}
}
