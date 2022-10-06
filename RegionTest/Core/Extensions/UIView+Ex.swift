//
//  UIView+Ex.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 3/10/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
