//
//  DateFormatterManager.swift
//
//
//  Created by Артём Клыч on 06.10.2023.
//

import Foundation

public final class DateFormatterManager: IDateFormatter {

    public static let dateFormatter = DateFormatter()
    
    // 3 * 60 * 60
    private let timeZone = TimeZone(secondsFromGMT: 10800)
    
    public init() {
        Self.dateFormatter.locale = Locale(identifier: "ru_RU")
        Self.dateFormatter.timeZone = timeZone
    }
    
    public func formatDate(_ date: Date, format: DateFormats) -> String {
        Self.dateFormatter.dateFormat = format.rawValue
        return Self.dateFormatter.string(from: date)
    }
    
    public func parseDate(_ dateString: String, format: DateFormats) -> Date? {
        Self.dateFormatter.dateFormat = format.rawValue
        return Self.dateFormatter.date(from: dateString)
    }
    
}
