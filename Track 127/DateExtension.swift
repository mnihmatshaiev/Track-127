//
//  DateExtension.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import Foundation
extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}
