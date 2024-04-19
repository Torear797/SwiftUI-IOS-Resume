//
//  DeviceEntity.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

public struct DeviceEntity: Decodable {
    public let Generation: String
    public let ANumber: [String]?
    public let Bootrom: [String]?
    public let FCCID: [String]?
    public let InternalName: [String]?
    public let Identifier: String
    public let price: Int
    public let year: Int
    public let type: DeviceType
    public let description: String?
    public let Models: [Model]
    
    public enum DeviceType: String, Codable, Hashable {
        case iphone, iPad, Watch
    }
    
    public struct Model: Decodable {
        public let CaseMaterial: String?
        public let Color: String
        public let size: String?
        public let Storage: String?
        public let Model: [String]
    }
}
