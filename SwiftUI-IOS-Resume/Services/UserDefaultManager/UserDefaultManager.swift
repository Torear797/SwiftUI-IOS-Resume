//
//  UserDefaultManager.swift
//  IOS-Resume
//
//  Created by Torear797 on 21.03.2023.
//

import Foundation

typealias UDM = UserDefaultManager

final class UserDefaultManager: IUserDefaultManager {
    
    enum Keys: String {
        case balance
    }
    
    // MARK: - Setters
    
    func setBalance(value: Float) {
        setValue(value, forKey: .balance)
    }
    
    // MARK: - Getters
    
    func getBalance() -> Float {
        getObjectValue(forKey: .balance) as? Float ?? 0
    }
    
    // MARK: - Remove Data
    
    func removeBalance() {
        removeObject(forKey: .balance)
    }
    
    // MARK: - UserDefaults Operations
    
    func setValue(_ value: Any?, forKey defaultName: Keys) {
        UserDefaults.standard.set(value, forKey: defaultName.rawValue)
    }
    
    func getBoolValue(forKey defaultName: Keys) -> Bool {
        UserDefaults.standard.bool(forKey: defaultName.rawValue)
    }
    
    func getObjectValue(forKey defaultName: Keys) -> Any? {
        UserDefaults.standard.object(forKey: defaultName.rawValue)
    }
    
    func getStringValue(forKey defaultName: Keys) -> String? {
        UserDefaults.standard.string(forKey: defaultName.rawValue)
    }
    
    func getStringArrayValue(forKey defaultName: Keys) -> [String]? {
        UserDefaults.standard.stringArray(forKey: defaultName.rawValue)
    }
    
    func getIntegerValue(forKey defaultName: Keys) -> Int {
        UserDefaults.standard.integer(forKey: defaultName.rawValue)
    }
    
    func getDataValue(forKey defaultName: Keys) -> Data? {
        UserDefaults.standard.data(forKey: defaultName.rawValue)
    }
    
    func removeObject(forKey defaultName: Keys) {
        UserDefaults.standard.removeObject(forKey: defaultName.rawValue)
    }
}
