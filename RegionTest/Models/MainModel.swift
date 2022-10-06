//
//  MainModel.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 30/9/22.
//

import Foundation

// MARK: - Welcome3
struct MainModel: Codable {
    let regionsList: RegionsList?
    
    enum CodingKeys: String, CodingKey {
        case regionsList
    }
    
    init(from decoder: Decoder) throws {
        let coder = try decoder.container(keyedBy: CodingKeys.self)
        regionsList = try? coder.decodeIfPresent(RegionsList.self, forKey: .regionsList)
    }
}

// MARK: - RegionsList
struct RegionsList: Codable {
    let region: [RegionsListRegion]?
    
    enum CodingKeys: String, CodingKey {
        case region
    }
    
    init(from decoder: Decoder) throws {
        let coder = try decoder.container(keyedBy: CodingKeys.self)
        region = try? coder.decodeIfPresent([RegionsListRegion].self, forKey: .region)
    }
}

// MARK: - RegionsListRegion
struct RegionsListRegion: Codable {
    let region: [PurpleRegion]?
    let type, name, translate: String?
    let innerDownloadSuffix: String?
    let boundary: Boundary?
    let polyExtract: String?
    let roads, wiki: Boundary?
    
    enum CodingKeys: String, CodingKey {
        case region
        case type, name, translate
        case innerDownloadSuffix
        case boundary
        case polyExtract
        case roads, wiki
    }
    
    init(from decoder: Decoder) throws {
        let coder = try decoder.container(keyedBy: CodingKeys.self)
        region = try? coder.decodeIfPresent([PurpleRegion].self, forKey: .region)
        type = try? coder.decodeIfPresent(String.self, forKey: .type)
        name = try? coder.decodeIfPresent(String.self, forKey: .name)
        translate = try? coder.decodeIfPresent(String.self, forKey: .translate)
        innerDownloadSuffix = try? coder.decodeIfPresent(String.self, forKey: .innerDownloadSuffix)
        boundary = try? coder.decodeIfPresent(Boundary.self, forKey: .boundary)
        polyExtract = try? coder.decodeIfPresent(String.self, forKey: .polyExtract)
        roads = try? coder.decodeIfPresent(Boundary.self, forKey: .roads)
        wiki = try? coder.decodeIfPresent(Boundary.self, forKey: .wiki)
    }
}

enum Boundary: String, Codable {
    case no = "no"
    case yes = "yes"
}

// MARK: - PurpleRegion
struct PurpleRegion: Codable {
    let region: [FluffyRegion]?
    let name, lang: String?
    let polyExtract: PolyExtract?
    let innerDownloadPrefix: InnerDownloadPrefix?
    let joinMapFiles: Boundary?
    let translate: String?
    let srtm, map, roads, hillshade: Boundary?
    let leftHandNavigation, joinRoadFiles, boundary: Boundary?
    let metric: String?
    
    enum CodingKeys: String, CodingKey {
        case region
        case name, lang
        case polyExtract
        case innerDownloadPrefix
        case joinMapFiles
        case translate
        case srtm, map, roads, hillshade
        case leftHandNavigation, joinRoadFiles, boundary
        case metric
    }
    
    init(from decoder: Decoder) throws {
        let coder = try decoder.container(keyedBy: CodingKeys.self)
        region = try? coder.decodeIfPresent([FluffyRegion].self, forKey: .region)
        name = try? coder.decodeIfPresent(String.self, forKey: .name)
        lang = try? coder.decodeIfPresent(String.self, forKey: .lang)
        polyExtract = try? coder.decodeIfPresent(PolyExtract.self, forKey: .polyExtract)
        innerDownloadPrefix = try? coder.decodeIfPresent(InnerDownloadPrefix.self, forKey: .innerDownloadPrefix)
        joinMapFiles = try? coder.decodeIfPresent(Boundary.self, forKey: .joinMapFiles)
        translate = try? coder.decodeIfPresent(String.self, forKey: .translate)
        srtm = try? coder.decodeIfPresent(Boundary.self, forKey: .srtm)
        map = try? coder.decodeIfPresent(Boundary.self, forKey: .map)
        roads = try? coder.decodeIfPresent(Boundary.self, forKey: .roads)
        hillshade = try? coder.decodeIfPresent(Boundary.self, forKey: .hillshade)
        leftHandNavigation = try? coder.decodeIfPresent(Boundary.self, forKey: .leftHandNavigation)
        joinRoadFiles = try? coder.decodeIfPresent(Boundary.self, forKey: .joinRoadFiles)
        boundary = try? coder.decodeIfPresent(Boundary.self, forKey: .boundary)
        metric = try? coder.decodeIfPresent(String.self, forKey: .metric)
    }
}

enum InnerDownloadPrefix: Codable {
    case name
}

enum PolyExtract: Codable {
    case eastEurope
    case france
    case germany
    case northEurope
    case southEurope
    case westEurope
}

// MARK: - FluffyRegion
struct FluffyRegion: Codable {
    let type: PurpleType?
    let name: String?
    let translate: String?
    let map, srtm, hillshade: Boundary?
    let region: [TentacledRegion]?
    let wiki: Boundary?
    let boundary, innerDownloadPrefix: String?
    let joinMapFiles: Boundary?
    let polyExtract: PolyExtract?
}

// MARK: - TentacledRegion
struct TentacledRegion: Codable {
    let type: FluffyType?
    let name: String?
    let translate, boundary: String?
    let srtm, hillshade: Boundary?
    let region: [StickyRegion]?
}

// MARK: - StickyRegion
struct StickyRegion: Codable {
    let name: String?
    let map: Boundary?
    let translate: String?
    let hillshade: Boundary?
}

enum FluffyType: Codable {
    case map
    case srtm
}

enum PurpleType: Codable {
    case hillshade
    case map
}
