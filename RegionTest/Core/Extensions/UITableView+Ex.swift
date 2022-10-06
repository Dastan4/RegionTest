//
//  UITableView+Ex.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 30/9/22.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerTableCell<Cell: UITableViewCell>(_ type: Cell.Type) {
        register(type, forCellReuseIdentifier: type.identifier())
    }
    
    func getReuseCell<Model: UITableViewCell>(_ type: Model.Type, for indexPath: IndexPath) -> Model {
        dequeueReusableCell(withIdentifier: type.identifier(), for: indexPath) as! Model
    }
}
