//
//  Units.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 6/10/22.
//

import Foundation

public struct Units {
  
  public let bytes: Int64
  
  public var kilobytes: Double {
    return Double(bytes) / 1_024
  }
  
  public var megabytes: Double {
    return kilobytes / 1_024
  }
  
  public var gigabytes: Double {
    return megabytes / 1_024
  }
  
  public init(bytes: Int64) {
    self.bytes = bytes
  }
  
  public func getReadableUnit() -> Double {
    
    switch bytes {
    case 0..<1_024:
        return Double(bytes)
    case 1_024..<(1_024 * 1_024):
        return Double(kilobytes)
    case 1_024..<(1_024 * 1_024 * 1_024):
        return Double(megabytes)
    case (1_024 * 1_024 * 1_024)...Int64.max:
      return Double(gigabytes)
    default:
      return Double(bytes)
    }
  }
}
