//
//  uiimage.swift
//  
//
//  Created by Dusan Juranovic on 10.8.21..
//

import UIKit

extension UIImage {
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

