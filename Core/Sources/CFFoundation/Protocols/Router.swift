//
//  Router.swift
//
//
//  Created by Артём Клыч on 13.02.2024.
//

import Foundation

@MainActor public protocol Router: ObservableObject {
    var canPopToRoot: Bool { get }
    func popToRoot()
}
