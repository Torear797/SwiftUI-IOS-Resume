//
//  UserDefaultManagerImpl.swift
//
//
//  Created by Артём Клыч on 14.02.2024.
//

import Foundation
import UserDefaultManagerAPI

public final class UserDefaultManagerImpl: UserDefaultManager {
    private let userDefaults = UserDefaults.standard
    
    public init() {}
    
    public func removeKeysValue() {
        for key in UserDefaults.ConstantKeys.allCases {
            removeObject(forKey: key.rawValue)
        }
    }
    
    // MARK: UserDefaults Methods
    
    public func set(_ value: Any?, forKey key: Keys) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    public func getBoolValue(forKey key: Keys) -> Bool {
        userDefaults.bool(forKey: key.rawValue)
    }
    
    public func getObjectValue(forKey key: Keys) -> Any? {
        userDefaults.object(forKey: key.rawValue)
    }
    
    public func getStringValue(forKey key: Keys) -> String? {
        userDefaults.string(forKey: key.rawValue)
    }
    
    public func getStringValue(forKey key: String) -> String? {
        userDefaults.string(forKey: key)
    }
    
    public func getStringArrayValue(forKey key: Keys) -> [String]? {
        userDefaults.stringArray(forKey: key.rawValue)
    }
    
    public func getIntegerValue(forKey key: Keys) -> Int {
        userDefaults.integer(forKey: key.rawValue)
    }
    
    public func getFloatValue(forKey key: Keys) -> Float {
        userDefaults.float(forKey: key.rawValue)
    }
    
    public func getDataValue(forKey key: Keys) -> Data? {
        userDefaults.data(forKey: key.rawValue)
    }
    
    public func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
