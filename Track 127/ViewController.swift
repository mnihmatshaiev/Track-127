//
//  ViewController.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import UIKit

class ViewController: UIViewController, TimeDependent {
    
    @IBOutlet weak var fromCityView: NextBusView!
    @IBOutlet weak var fromVillageView: NextBusView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromCityView.timeTable = TimeTables.fromCityTable
        fromVillageView.timeTable = TimeTables.fromVillageTable
        fromCityView.placeLabel.text = "From city"
        fromVillageView.placeLabel.text = "From village"
        self.updateNextBus(view: &self.fromCityView)
        self.updateNextBus(view: &self.fromVillageView)
        TimeSyncer.shared.addDelegate(delegate: self)
    }
    
    func updateNextBus(view: inout NextBusView) {
        view.currentNext = view.timeTable.getCurrentNext()
    }
    
    func performOnTick() {
        self.updateNextBus(view: &self.fromCityView)
        self.updateNextBus(view: &self.fromVillageView)
    }
}

