//
//  NetworkService.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 1/10/22.
//

import Foundation
import Moya

enum MyService {
    case downloadMap(standard: String, file: String)
}

// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    var baseURL: URL { URL(string: "http://download.osmand.net")! }
    var path: String {
        switch self {
        case .downloadMap:
            return "download.php"
        }
    }
    var method: Moya.Method {
        switch self {
        case .downloadMap:
            return .get
        }
    }
    var task: Task {
        switch self {
            
        case let .downloadMap(standard, file):
            var query = [String: Any]()
            query["standard"] = standard
            query["file"] = file
            return .requestParameters(parameters: query, encoding: URLEncoding.queryString)
        }
        
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
