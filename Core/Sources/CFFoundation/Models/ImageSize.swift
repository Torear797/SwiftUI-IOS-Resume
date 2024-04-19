//
//  ImageSize.swift
//  
//
//  Created by Артём Клыч on 11.08.2023.
//

import Foundation

public struct ImageSize: Identifiable, Equatable, Hashable {
    public let id: String
    public let preview: URL
    public let original: URL
    public let width: Int?
    public let height: Int?
    
    public init(id: String = UUID().uuidString, url: URL) {
        self.id = id
        self.preview = url
        self.original = url
        self.width = nil
        self.height = nil
    }
    
    public init(id: String = UUID().uuidString, preview: URL, original: URL) {
        self.id = id
        self.preview = preview
        self.original = original
        self.width = nil
        self.height = nil
    }
    
    public init(
        id: String = UUID().uuidString,
        preview: URL,
        original: URL,
        width: Int,
        height: Int
    ) {
        self.id = id
        self.preview = preview
        self.original = original
        self.width = width
        self.height = height
    }
    
    public static func == (lhs: ImageSize, rhs: ImageSize) -> Bool {
        lhs.preview == rhs.preview &&
        lhs.original == rhs.original &&
        lhs.width == rhs.width &&
        lhs.height == rhs.height
    }
}
