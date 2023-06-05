//
//  DevicesAnswer.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.01.2023.
//

import Foundation

struct DeviceInfo: Codable, Hashable {
    
    let Generation: String
    let ANumber: [String]?
    let Bootrom: [String]?
    let FCCID: [String]?
    let InternalName: [String]?
    let Identifier: String
    let price: Int
    let year: Int
    let type: DeviceType
    let description: String?
    let Models: [Model]
    
    var originalURL: URL {
        if type == .iPad {
            let originalString = "\(NetworkConfig.baseUrl)/devices/apple/images/original/ipad.png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        } else {
            let originalString = "\(NetworkConfig.baseUrl)/devices/apple/images/original/\(Generation).png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        }
    }
    
    var previewURL: URL {
        if type == .iPad {
            let originalString = "\(NetworkConfig.baseUrl)/devices/apple/images/preview/ipad.png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        } else {
            let originalString = "\(NetworkConfig.baseUrl)/devices/apple/images/preview/\(Generation).png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        }
    }
    
    enum DeviceType: String, Codable, Hashable {
        case iphone, iPad, Watch
    }
    
    struct Model: Codable, Hashable {
        let CaseMaterial: String?
        let Color: String
        let size: String?
        let Storage: String?
        let Model: [String]
    }
    
}

extension [DeviceInfo] {
    
    func getCategories() -> [Category] {
        var categories: [Category] = []
        
        let iphones = self
            .filter({ $0.type == .iphone })
            .sorted(by: { $0.year > $1.year })
        
        if !iphones.isEmpty, let first = iphones.first {
            categories.append(Category(
                id: 0,
                name: "iPhones",
                description: "Смартфоны",
                imageURL: first.previewURL,
                items: iphones
            ))
        }
        
        let ipads = self
            .filter({ $0.type == .iPad })
            .sorted(by: { $0.year > $1.year })
        
        if !ipads.isEmpty, let first = ipads.first {
            categories.append(Category(
                id: 1,
                name: "iPads",
                description: "Планшеты",
                imageURL: first.previewURL,
                items: ipads
            ))
        }
        
        let watch = self
            .filter({ $0.type == .Watch })
            .sorted(by: { $0.year > $1.year })
        
        if !watch.isEmpty, let first = watch.first {
            categories.append(Category(
                id: 2,
                name: "Watch",
                description: "Часы",
                imageURL: first.previewURL,
                items: watch
            ))
        }
        
        
        return categories
    }
    
}

extension DeviceInfo: Identifiable {
  var id: String { Identifier }
}

extension DeviceInfo: Equatable {
    static func == (lhs: DeviceInfo, rhs: DeviceInfo) -> Bool {
        lhs.id == rhs.id
    }
}
