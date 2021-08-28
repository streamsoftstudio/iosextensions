//
//  uilabel.swift
//  iOSExtensions
//
//  Created by Dusan Juranovic on 28.8.21..
//

import UIKit

extension UILabel {
	func animateEllipsis(_ string: String, timeInterval: TimeInterval = 0.5, ellipsisSymbol: String = ".", ellipsisCount: Int = 3) {
		self.text = string
		var index = 1
		
		Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
			if self.text!.prefix(string.count) != string {
				timer.invalidate()
			} else {
				self.text = string.appending(Array(repeating: ellipsisSymbol, count: index).joined())
				index += 1
				index = index % (ellipsisCount + 1)
			}
		}
	}
}
