//
//  date.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

public extension Date {
    /// The hour component of the date in the current calendar.
    var hour: Int { Calendar.current.component(.hour, from: self) }
    /// The minute component of the date in the current calendar.
    var minute: Int { Calendar.current.component(.minute, from: self) }
    /// The day component of the date in the current calendar.
    var day: Int { Calendar.current.component(.day, from: self) }
    /// The month component of the date in the current calendar.
    var month: Int { Calendar.current.component(.month, from: self) }
    /// The year component of the date in the current calendar.
    var year: Int { Calendar.current.component(.year, from: self) }

    /// Returns a new date with the same year/month/day as the receiver but the
    /// given `hour` and `minute` (seconds zeroed), or `nil` if those components
    /// don't resolve to a valid date.
    func setting(hour: Int, minute: Int) -> Date? {
        Calendar.current.date(from: DateComponents(
            calendar: Calendar.current,
            year: year, month: month, day: day,
            hour: hour, minute: minute, second: 0
        ))
    }
}
