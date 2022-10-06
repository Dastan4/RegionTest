//
//  String+Ex.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 30/9/22.
//

import Foundation
import UIKit

extension String {

    var hex: Int? {
        return Int(self, radix: 16)
    }
}
