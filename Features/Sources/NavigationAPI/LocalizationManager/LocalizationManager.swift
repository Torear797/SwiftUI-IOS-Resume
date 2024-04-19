//
//  LocalizationManager.swift
//  
//
//  Created by Артём Клыч on 14.02.2024.
//

import SwiftUI
import CFFoundation

enum LocalizationManager {
    static let films = "Films".localizedString
    static let devices = "Devices".localizedString
    static let store = "Store".localizedString
}

extension String {
    var localizedString: String {
        Bundle.module.localizedString(forKey: self)
    }
}
