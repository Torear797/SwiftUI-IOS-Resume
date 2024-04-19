//
//  Device.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import CFFoundation
import Foundation

public struct Device: Identifiable, Equatable {
    public let id: String
    public let generation: String
    public let aNumber: [String]?
    public let bootrom: [String]?
    public let fccid: [String]?
    public let internalName: [String]?
    public let price: Int
    public let year: Int
    public let type: DeviceType
    public let description: String?
    public let models: [Model]
    public let image: ImageSize
    
    public init(
        id: String,
        generation: String,
        aNumber: [String]?,
        bootrom: [String]?,
        fccid: [String]?,
        internalName: [String]?,
        price: Int,
        year: Int,
        type: DeviceType,
        description: String?,
        models: [Model],
        image: ImageSize
    ) {
        self.id = id
        self.generation = generation
        self.aNumber = aNumber
        self.bootrom = bootrom
        self.fccid = fccid
        self.internalName = internalName
        self.price = price
        self.year = year
        self.type = type
        self.description = description
        self.models = models
        self.image = image
    }
    
    public struct Model: Equatable {
        public let caseMaterial: String?
        public let color: String
        public let size: String?
        public let storage: String?
        public let model: [String]
        
        public init(
            caseMaterial: String?,
            color: String,
            size: String?,
            storage: String?,
            model: [String]
        ) {
            self.caseMaterial = caseMaterial
            self.color = color
            self.size = size
            self.storage = storage
            self.model = model
        }
    }
    
    public enum DeviceType: String {
        case iPhone, iPad, watch
    }
}
