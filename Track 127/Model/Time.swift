//
//  Time.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import Foundation

class Time: CustomStringConvertible, Comparable {
    static func < (lhs: Time, rhs: Time) -> Bool {
        return lhs.timeFromDayBegining < rhs.timeFromDayBegining
    }
    
    static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.timeFromDayBegining == rhs.timeFromDayBegining
    }
    
    var description: String {
        let h = hours
        let m = minutes
        if h == 0 {
            return "\(m)m."
        } else {
            return "\(h)h\(m)m."
        }
    }
    
    let timeFromDayBegining: TimeInterval
    
    init(time: Double) {
        timeFromDayBegining = time
    }
    
    init (hours: Int, minutes: Int) {
        timeFromDayBegining = Double(hours) * 60 * 60 + Double(minutes) * 60
    }
    
    var hours: Int {
        return Int(timeFromDayBegining / 3600)
    }
    
    var minutes: Int {
        let seconds = (Int((timeFromDayBegining - Double(hours) * 3600.0)) % 60)
        return Int((timeFromDayBegining - Double(hours) * 3600.0) / 60) + (seconds == 0 ? 0 : 1)
    }
    
    static func -(lhs: Time, rhs: Time) -> Time {
        return Time(time: abs((lhs.timeFromDayBegining - rhs.timeFromDayBegining)))
    }
}

class TimeTable {
    let table: [Time]
    
    init(initialTable: [Time]) {
        table = initialTable
    }
    
    convenience init(initialTableSimple: [(hours: Int, minutes: Int)]) {
        var newTable: [Time] = []
        for val in initialTableSimple {
            newTable.append(Time(hours: val.hours, minutes: val.minutes))
        }
        self.init(initialTable: newTable)
    }
    
    private func getClosest(from: Date) -> Time? {
        let currentElapsedTime = Date().timeIntervalSince(from)
        for interval in table {
            if interval.timeFromDayBegining >= currentElapsedTime {
                return interval
            }
        }
        return nil
    }
    
    func getClosestFromNow() -> (Time?, Time) {
        guard let closestTime = getClosest(from: Date().startOfDay) else { return (nil, Time(time: 0)) }
        let timeToClosest = closestTime - Time(time: Date().timeIntervalSince(Date().startOfDay))
        return (closestTime, timeToClosest)
    }
    
}
