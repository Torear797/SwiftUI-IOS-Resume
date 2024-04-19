//
//  IDateFormatter.swift
//
//
//  Created by Артём Клыч on 06.10.2023.
//

import Foundation

public protocol IDateFormatter {
    func formatDate(_ date: Date, format: DateFormats) -> String
    func parseDate(_ dateString: String, format: DateFormats) -> Date?
}
