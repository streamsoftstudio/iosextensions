//
//  calayer.swift
//  iOSExtensions
//
//  Created by Dusan Juranovic on 10.8.21..
//

import UIKit

public extension CALayer {
	///Adds a shadow to a `CALayer`.
	func addShadow(_ offset: CGSize = CGSize(width: 0, height: 3.0), color: CGColor = UIColor.black.cgColor, opacity: Float = 0.2, radius: CGFloat = 2, rasterize: Bool = true) {
		self.masksToBounds = false
		self.shadowRadius = radius
		self.shadowColor = color
		self.shadowOpacity = opacity
		self.shadowOffset = offset
		
		if rasterize {
			self.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius).cgPath
			self.shouldRasterize = true
			self.rasterizationScale = UIScreen.main.scale
		}
	}
	
	///Adds corner radius to `CALayer`'s selected corners.
	func addCorners(_ corners:UIRectCorner, radius: CGFloat) {
		let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.mask = mask
	}
}
