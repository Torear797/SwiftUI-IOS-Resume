//
//  DeviceView.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.01.2023.
//

import SwiftUI

struct DeviceView: View {
    
    let item: CatalogItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            KingfisherImage(url: item.image, contentMode: .fit)
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .font(.callout)
                    .foregroundColor(Color("Text"))
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(Color("Description"))
                
                Spacer()

                Divider()
            }
            .multilineTextAlignment(.leading)
            .lineLimit(1)
        }
        .frame(height: 100)
    }
}
