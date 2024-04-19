//
//  LocalizationManager.swift
//  
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

enum LocalizationManager {
    static let store = "Store".localizedString
    static let alertTitle = "Top up your balance in your personal account".localizedString
    static let alertCaption = "You don't have enough money to buy".localizedString
}

extension String {
    var localizedString: String {
        Bundle.module.localizedString(forKey: self)
    }
}
