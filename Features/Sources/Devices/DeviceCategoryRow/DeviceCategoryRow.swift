//
//  DeviceCategoryRow.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import DevicesAPI
import SwiftUI

struct DeviceCategoryRow: View {
    let category: DeviceCategory
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            KingfisherImage(url: category.imageURL, contentMode: .fit)
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(category.name)
                    .font(.headline)
                    .foregroundStyle(Color.text)
                
                Text(category.description)
                    .font(.subheadline)
                    .foregroundStyle(Color.caption)
            }
        }
    }
}
