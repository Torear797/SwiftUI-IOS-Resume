//
//  DeviceCategory.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

public struct DeviceCategory: Identifiable, Equatable {
    public let id: Int
    public let name: String
    public let description: String
    public let imageURL: URL
    public let devices: [Device]
    
    public init(
        id: Int,
        name: String,
        description: String,
        imageURL: URL,
        devices: [Device]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.devices = devices
    }
}
