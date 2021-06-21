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
    
    let fromCityTable = TimeTable(initialTable: [
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
    
    let fromVillageTable = TimeTable(initialTable: [
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
        view.currentNext = view.timeTable.getCurrentNext()
    }
    
}

