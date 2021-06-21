//
//  ScheduleViewController.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import UIKit

class ScheduleViewController: UITableViewController, TimeDependent {
    lazy var dataSource = configureDataSource()
    var cellIdentifier = "cell"
    
    func updateSnapshot() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        updateSnapshot()
        TimeSyncer.shared.addDelegate(delegate: self)
    }
    
    func performOnTick() {
        updateSnapshot()
    }
    
    func configureDataSource() -> ScheduleDiffableDataSource {
        let dataSource = ScheduleDiffableDataSource(tableView: tableView) { tableView, indexPath, time in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            cell.textLabel?.text = time.formatAbsolute()
            let currTime = Time(seconds: abs(Int(Date().timeIntervalSince(Date().startOfDay))))
            cell.detailTextLabel?.text = (time.status == .gone) ? "----" : (time - currTime).formatRemaining()
            cell.backgroundColor = time.getColor()
            return cell
        }
        return dataSource
    }

}
