//
//  Inject.swift
//  IOS-Resume
//
//  Created by Torear797 on 10.05.2023.
//

import Foundation

@propertyWrapper
struct Inject<Component> {
    let wrappedValue: Component
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}
