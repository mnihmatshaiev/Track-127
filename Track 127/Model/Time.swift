//
//  Time.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import Foundation
import UIKit

struct Time {
    private let _seconds: Int
    
    init(seconds: Int) {
        self._seconds = seconds
    }
    
    init(hours: Int, minutes: Int, seconds: Int = 0) {
        self.init(seconds: hours * 3600 + minutes * 60 + seconds)
    }
    
    var hours: Int {
        return _seconds / 3600
    }
    
    var minutes: Int {
        return (_seconds % 3600) / 60 + (seconds == 0 ? 0 : 1)
    }
    
    var seconds: Int {
        return _seconds % 60
    }
    
    enum Status {
        case gone
        case nextGreen
        case nextOrange
        case nextFar
    }
    
    var status: Status = .gone
}

// Adopt Comparable and Hashable interfaces
extension Time: Comparable, Hashable {
    static func <(lhs: Time, rhs: Time) -> Bool {
        return lhs._seconds < rhs._seconds
    }
    
    static func ==(lhs: Time, rhs: Time) -> Bool {
        return lhs._seconds == rhs._seconds
    }
    
    static func -(lhs: Time, rhs: Time) -> Time {
        return Time(seconds: abs(lhs._seconds - rhs._seconds))
    }
}

// Add formating and color
extension Time {
    func formatRemaining() -> String {
        let h = hours
        let m = minutes
        if h == 0 {
            return "\(m)m."
        } else {
            return "\(h)h\(m)m."
        }
    }
    
    func formatAbsolute() -> String {
        return "\(hours):\(String(minutes).padding(toLength: 2, withPad: "0", startingAt: 0))"
    }
    
    func getColor() -> UIColor {
        switch self.status {
        case .gone: return .systemRed
        case .nextFar: return .white
        case .nextGreen: return .systemGreen
        case .nextOrange: return .systemOrange
        }
    }
}

class TimeTable {
    var table: [Time]
    
    init(initialTable: [Time]) {
        table = initialTable
    }
    
    func updateTable(referencing refTime: Time) {
        var foundNext: Bool = false
        for (i, time) in table.enumerated() {
            if time <= refTime {
                table[i].status = .gone
            } else if (time-refTime) <= Time(hours: 0, minutes: 15) {
                table[i].status = .nextOrange
                foundNext.toggle()
            } else if foundNext {
                table[i].status = .nextFar
            } else {
                table[i].status = .nextGreen
                foundNext.toggle()
            }
        }
    }
    
    func updateTableForNow() {
        let currTime = Time(seconds: abs(Int(Date().timeIntervalSince(Date().startOfDay))))
        updateTable(referencing: currTime)
    }
    
    func getCurrentNext() -> Time? {
        updateTableForNow()
        return table.first { time in
            return time.status == .nextGreen || time.status == .nextOrange
        }
    }
}

struct TimeTables {
    static var fromCityTable = TimeTable(initialTable: [
        Time(hours: 5, minutes: 40),
        Time(hours: 6, minutes: 20),
        Time(hours: 7, minutes: 00),
        Time(hours: 8, minutes: 25),
        Time(hours: 9, minutes: 10),
        Time(hours: 10, minutes: 00),
        Time(hours: 10, minutes: 40),
        Time(hours: 11, minutes: 15),
        Time(hours: 12, minutes: 00),
        Time(hours: 12, minutes: 35),
        Time(hours: 13, minutes: 15),
        Time(hours: 13, minutes: 55),
        Time(hours: 14, minutes: 35),
        Time(hours: 15, minutes: 15),
        Time(hours: 15, minutes: 50),
        Time(hours: 16, minutes: 40),
        Time(hours: 17, minutes: 10),
        Time(hours: 17, minutes: 45),
        Time(hours: 18, minutes: 20),
        Time(hours: 19, minutes: 00),
        Time(hours: 20, minutes: 00),
        Time(hours: 21, minutes: 00)
    ])
    
    static var fromVillageTable = TimeTable(initialTable: [
        Time(hours: 6, minutes: 15),
        Time(hours: 6, minutes: 50),
        Time(hours: 7, minutes: 40),
        Time(hours: 8, minutes: 20),
        Time(hours: 9, minutes: 10),
        Time(hours: 9, minutes: 55),
        Time(hours: 10, minutes: 45),
        Time(hours: 11, minutes: 35),
        Time(hours: 12, minutes: 05),
        Time(hours: 12, minutes: 45),
        Time(hours: 13, minutes: 25),
        Time(hours: 14, minutes: 10),
        Time(hours: 14, minutes: 50),
        Time(hours: 15, minutes: 25),
        Time(hours: 16, minutes: 10),
        Time(hours: 16, minutes: 50),
        Time(hours: 17, minutes: 20),
        Time(hours: 18, minutes: 00),
        Time(hours: 19, minutes: 10),
        Time(hours: 19, minutes: 50),
        Time(hours: 20, minutes: 45),
        Time(hours: 21, minutes: 40)
    ])
}
