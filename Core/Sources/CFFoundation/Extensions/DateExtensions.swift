//
//  DateExtensions.swift
//
//
//  Created by Артём Клыч on 07.02.2024.
//

import Foundation

public extension Date {
    func isEqualDay(_ date: Date) -> Bool {
        let calendar = Calendar.current
        
        let components1 = calendar.dateComponents(
            [.day, .month, .year],
            from: self
        )
        
        let components2 = calendar.dateComponents(
            [.day, .month, .year],
            from: date
        )
        
        return components1.day == components2.day &&
        components1.month == components2.month &&
        components1.year == components2.year
    }
}
