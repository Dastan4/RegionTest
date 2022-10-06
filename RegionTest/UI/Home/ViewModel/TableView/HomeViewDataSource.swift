//
//  HomeViewDataSource.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 30/9/22.
//

import Foundation
import UIKit

typealias Tap = (() -> ())?

struct HomeTableViewSection {
    let header: String?
    let items: [Item]
    
    enum Item {
        case progress(free: Double, percentage: Double)
        case country(text: String, tap: Tap)
    }
}

class HomeViewDataSource: NSObject, UITableViewDataSource {
    
    private var data = [HomeTableViewSection]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getReuseCell(CountryTableViewCell.self,
                                          for: indexPath)
        let storageCell = tableView.getReuseCell(StorageTableViewCell.self,
                                                 for: indexPath)
        let item = data[indexPath.section].items[indexPath.row]
        if indexPath.section == 0 {
            storageCell.fill(with: item)
            return storageCell
        }
        else {
            cell.fill(with: item)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        data[section].header
    }
    
    func fill(with data: [HomeTableViewSection]) {
        self.data = data
    }
}
