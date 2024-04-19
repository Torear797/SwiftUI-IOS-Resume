//
//  ViewModel.swift
//
//
//  Created by Артём Клыч on 24.02.2024.
//

import Foundation

@MainActor public protocol RootViewModel: ObservableObject {
    var topViewID: String { get }
}
