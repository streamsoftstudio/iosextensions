//
//  File.swift
//  
//
//  Created by Andrija Milovanovic on 11/12/20.
//

import Foundation

extension Date
{
    func from(hour:Int, minute:Int) -> Date {
        return Calendar.current.date(from: DateComponents(calendar:  Calendar.current, year: self.year, month: self.month, day: self.day, hour: hour, minute: minute, second: 0)) ?? Date()
    }
    
    var h:Int { return  Calendar.current.component(.hour, from: self) }
    var m:Int {  return Calendar.current.component(.minute, from: self)}
    var day:Int { return  Calendar.current.component(.day, from: self) }
    var month:Int { return  Calendar.current.component(.month, from: self)}
    var year:Int { return  Calendar.current.component(.year, from: self)}
}

