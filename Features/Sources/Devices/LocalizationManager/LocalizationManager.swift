//
//  LocalizationManager.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

enum LocalizationManager {
    static let categories = "Categories".localizedString
}

extension String {
    var localizedString: String {
        Bundle.module.localizedString(forKey: self)
    }
}
