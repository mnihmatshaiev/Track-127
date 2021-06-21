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
    
    var timeTable: TimeTable = TimeTable(initialTableSimple: [])
}
