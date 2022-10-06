//
//  Dictionary+Ex.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 3/10/22.
//

import Foundation
import UIKit

extension Dictionary where Key: Encodable, Value: Encodable {
    
    var toData: Data {
        (try? JSONSerialization.data(withJSONObject: self)) ?? Data()
    }
    
    var toPretty: NSString {
        toData.pretty ?? ""
    }
}
