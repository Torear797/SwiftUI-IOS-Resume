//
//  IUserDefaultManager.swift
//  IOS-Resume
//
//  Created by Torear797 on 21.03.2023.
//

import Foundation

protocol IUserDefaultManager {
    
    // MARK: - Setters
     
    func setBalance(value: Float)
    
    // MARK: - Getters
    
    func getBalance() -> Float
    
    // MARK: - Remove Data
    
    func removeBalance()
    
    // MARK: - UserDefaults Operations
    
    func setValue(_ value: Any?, forKey defaultName: UDM.Keys)
    
    func getBoolValue(forKey defaultName: UDM.Keys) -> Bool
    func getObjectValue(forKey defaultName: UDM.Keys) -> Any?
    func getStringValue(forKey defaultName: UDM.Keys) -> String?
    func getStringArrayValue(forKey defaultName: UDM.Keys) -> [String]?
    func getIntegerValue(forKey defaultName: UDM.Keys) -> Int
    func getDataValue(forKey defaultName: UDM.Keys) -> Data?
    
    func removeObject(forKey defaultName: UDM.Keys)
}
