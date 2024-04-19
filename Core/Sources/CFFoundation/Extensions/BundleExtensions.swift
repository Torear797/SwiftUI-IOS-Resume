//
//  BundleExtensions.swift
//
//
//  Created by Артём Клыч on 31.01.2024.
//

import Foundation

public extension Bundle {
    func localizedString(forKey key: String) -> String {
        localizedString(forKey: key, value: nil, table: nil)
    }
    
    var version: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    func infoForKey(_ key: String) -> String? {
        (self.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}
