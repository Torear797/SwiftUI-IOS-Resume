//
//  Inject.swift
//
//
//  Created by Артём Клыч on 10.05.2023.
//

import Foundation

@propertyWrapper
public struct Inject<Component> {
    public let wrappedValue: Component
    public init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}
