//
//  LocalizationManager.swift
//  
//
//  Created by Артём Клыч on 31.03.2024.
//

import Foundation

enum LocalizationManager {
    static let menu = "Menu".localizedString
}

extension String {
    var localizedString: String {
        Bundle.module.localizedString(forKey: self)
    }
}
