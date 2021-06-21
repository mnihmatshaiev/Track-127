//
//  FromCityScheduleViewController.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import UIKit

class FromVillageScheduleViewController: ScheduleViewController {
    var table = TimeTables.fromVillageTable
    
    override func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Time>()
        snapshot.appendSections([.all])
        snapshot.appendItems(table.table, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
