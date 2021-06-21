//
//  ScheduleDiffableDataSource.swift
//  Track 127
//
//  Created by Никита Нигматшаев on 21.06.2021.
//

import Foundation
import UIKit

enum Section {
    case all
}

class ScheduleDiffableDataSource: UITableViewDiffableDataSource<Section, Time> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
