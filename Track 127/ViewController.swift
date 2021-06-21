//
//  ViewController.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromCityView: NextBusView!
    @IBOutlet weak var fromVillageView: NextBusView!
    
    let fromCityTable = TimeTable(initialTableSimple: [
    (5, 40),
    (6, 20),
    (7, 00),
    (8, 25),
    (9, 10),
    (10, 00),
    (10, 40),
    (11, 15),
    (12, 00),
    (12, 35),
    (13, 15),
    (13, 55),
    (14, 35),
    (15, 15),
    (15, 50),
    (16, 40),
    (17, 10),
    (17, 45),
    (18, 20),
    (19, 00),
    (20, 00),
    (21, 00)
    ])
    
    let fromVillageTable = TimeTable(initialTableSimple: [
    (6, 15),
    (6, 50),
    (7, 40),
    (8, 20),
    (9, 10),
    (9, 55),
    (10, 45),
    (11, 35),
    (12, 05),
    (12, 45),
    (13, 25),
    (14, 10),
    (14, 50),
    (15, 25),
    (16, 10),
    (16, 50),
    (17, 20),
    (18, 00),
    (19, 10),
    (19, 50),
    (20, 45),
    (21, 40)
    ])
    
    var timer: Timer?
    var smth = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        fromCityView.timeTable = fromCityTable
        fromVillageView.timeTable = fromVillageTable
        fromCityView.placeLabel.text = "From city"
        fromVillageView.placeLabel.text = "From village"
        self.updateNextBus(view: &self.fromCityView)
        self.updateNextBus(view: &self.fromVillageView)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.updateNextBus(view: &self.fromCityView)
            self.updateNextBus(view: &self.fromVillageView)
        })
    }
    
    func updateNextBus(view: inout NextBusView) {
        let (closestTime, timeToClosest) = view.timeTable.getClosestFromNow()
        if let closestTime = closestTime {
            view.nextScheduledLabel.text = "\(closestTime.hours):\(String(closestTime.minutes).padding(toLength: 2, withPad: "0", startingAt: 0))"
            view.remainingTimeLabel.text = String(describing: timeToClosest)
            view.remainingTimeLabel.backgroundColor = (timeToClosest < Time(hours: 0, minutes: 15)) ? .systemOrange : .systemGreen
        } else {
            view.nextScheduledLabel.text = "----"
            view.remainingTimeLabel.text = "----"
        }
    }
    
}

