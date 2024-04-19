//
//  SwiftUIView.swift
//  
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import DevicesAPI
import SwiftUI

struct DeviceRow: View {
    let device: Device
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            KingfisherImage(url: device.image.preview, contentMode: .fit)
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(device.generation)
                    .font(.headline)
                    .foregroundStyle(Color.text)
                
                Text(device.year.description)
                    .font(.subheadline)
                    .foregroundStyle(Color.caption)
            }
        }
    }
}
