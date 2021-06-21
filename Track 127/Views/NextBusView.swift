//
//  NextBusView.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import UIKit

class NextBusView: UIView {

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var nextScheduledLabel: UILabel!
    
    var timeTable: TimeTable!
    var currentNext: Time? {
        didSet {
            if let currentNext = currentNext {
                remainingTimeLabel.backgroundColor = currentNext.getColor()
                let currTime = Time(seconds: Int(Date().timeIntervalSince(Date().startOfDay)))
                nextScheduledLabel.text = currentNext.formatAbsolute()
                remainingTimeLabel.text = (currentNext - currTime).formatRemaining()
            } else {
                remainingTimeLabel.backgroundColor = .systemRed
                nextScheduledLabel.text = "----"
                remainingTimeLabel.text = "----"
            }
        }
    }
}
