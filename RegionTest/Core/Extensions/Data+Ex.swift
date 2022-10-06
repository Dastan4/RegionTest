//
//  Data+Ex.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 3/10/22.
//

import Foundation
import UIKit

extension Data {
    
    var pretty: NSString? {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else { return nil }
        return string
    }
}
