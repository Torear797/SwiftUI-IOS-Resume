//
//  UserDefaultManager.swift
//
//
//  Created by Артём Клыч on 14.02.2024.
//

import Foundation

public protocol UserDefaultManager {
    typealias Keys = UserDefaults.Keys
    
    func set(_ value: Any?, forKey key: Keys)
    func getStringValue(forKey key: Keys) -> String?
    func getStringValue(forKey key: String) -> String?
    
    func removeKeysValue()
}

public extension UserDefaults {
    enum Keys: String, CaseIterable {
        case eventChainsSorting
        case eventChainsSortingDateOption
        case eventChainsSortingTextOption
        case lastUpdateDateDayEvent
        case dayEvent
    }
    
    enum ConstantKeys: String, CaseIterable {
        case onboardingIsComplete
    }
}
