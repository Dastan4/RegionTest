//
//  HomeViewModel.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 30/9/22.
//

import Foundation
import Moya

protocol IHomeViewModel {
    func transform(with output: HomeViewModel.Output) -> HomeViewModel.Input
}

class HomeViewModel: IHomeViewModel {
    
    private let provider = MoyaProvider<MyService>()
    private let xmlParser = XMLParserService()
    
    private var model: [MainModel] = []
    
    func transform(with output: Output) -> Input {
        let data = fetchData()
        output.tableData?(data) // transfer on viewController
        return Input(
            itemTapped: { indexPath in
                let item = data[indexPath.section].items[indexPath.row]
                switch item {
                case .country(let text, _):
                    print(text)
                case .progress:
                    break
                }
            }
        )
    }
    
    private func fetchData() -> [HomeTableViewSection] {
        var sections: [HomeTableViewSection] = [
            HomeTableViewSection(header: nil, items: [.progress(
                free: Units(
                    bytes: deviceRemainingFreeSpaceInBytes() ?? 0).getReadableUnit(),
                percentage:
                    percentageOfFree(
                        free: Units(
                            bytes: deviceRemainingFreeSpaceInBytes() ?? 0).getReadableUnit(),
                        all: Units(
                            bytes: deviceRemainingAllSpaceInBytes() ?? 0).getReadableUnit())
            )])
        ]
        if let path = Bundle.main.path(forResource: "europe", ofType: "xml") {
            if let parser = XMLParser(contentsOf: URL(fileURLWithPath: path)) {
                xmlParser.sendModel = { data in
                    var country: [HomeTableViewSection.Item] = []
                    data.forEach { a in
                        country.append(.country(text: a.name ?? "",
                                                tap: {
                            print("\(a.name ?? "") Download tapped")
                        }))
                    }
                    sections.append(HomeTableViewSection(header: "Europe",
                                                         items: country))
                }
                parser.delegate = xmlParser
                parser.parse()
            }
        }
        return sections
    }
    
    private func deviceRemainingFreeSpaceInBytes() -> Int64? {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        guard
            let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: documentDirectory),
            let freeSize = systemAttributes[.systemFreeSize] as? NSNumber
        else {
            return nil
        }
        return freeSize.int64Value
    }
    
    private func deviceRemainingAllSpaceInBytes() -> Int64? {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        guard
            let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: documentDirectory),
            let allSize = systemAttributes[.systemSize] as? NSNumber
        else {
            return nil
        }
        return allSize.int64Value
    }
    
    private func percentageOfFree(free: Double, all: Double) -> Double {
        free * 100 / all / 100
    }
}

extension HomeViewModel {
    struct Output {
        let tableData: (([HomeTableViewSection]) -> ())?
    }
    struct Input {
        let itemTapped: ((IndexPath) -> ())?
    }
}

