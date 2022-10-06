//
//  XMPParaserService.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 4/10/22.
//

import Foundation
import UIKit

class XMLParserService: NSObject, XMLParserDelegate {
    
    private var model: [RegionsListRegion] = []
    var elementName: String = String()
    var sendModel: (([RegionsListRegion]) -> ())?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "region" {
            let decoder = JSONDecoder()
            if
                let data = try? JSONSerialization.data(withJSONObject: attributeDict),
                let jsonPetitions = try? decoder.decode(RegionsListRegion.self, from: attributeDict.toData)
            {
                if attributeDict["lang"] == "sq" ||
                    attributeDict["lang"] == "ca" ||
                    attributeDict["lang"] == "de" ||
                    attributeDict["lang"] == "pt" ||
                    attributeDict["lang"] == "be,ru" ||
                    attributeDict["lang"] == "nl,fr,de" ||
                    attributeDict["lang"] == "bs,hr,sr" ||
                    attributeDict["lang"] == "bg" ||
                    attributeDict["lang"] == "hr" ||
                    attributeDict["lang"] == "el,tr" ||
                    attributeDict["lang"] == "cs,sk" ||
                    attributeDict["lang"] == "da" ||
                    attributeDict["lang"] == "et" ||
                    attributeDict["lang"] == "fo" ||
                    attributeDict["lang"] == "fi,sv" ||
                    attributeDict["lang"] == "fr"
                {
                    self.model.append(jsonPetitions)
                } else {
                    return
                }
                print("😂", jsonPetitions)
            }
        }
        self.elementName = elementName
        print("🕺", attributeDict.toPretty)
//        print("😆", attributeDict.toData)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == "region" {
//
//        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
//        if (!data.isEmpty) {
//            if self.elementName == "join_map_files" {
//                model.append(RegionsListRegion(region: [], type: nil, name: data, translate: nil, innerDownloadSuffix: nil, boundary: nil, polyExtract: nil, roads: nil, wiki: nil))
//            }
//        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        sendModel?(model)
    }
    
}
