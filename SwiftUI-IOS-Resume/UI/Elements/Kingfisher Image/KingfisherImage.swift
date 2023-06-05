//
//  KingfisherImage.swift
//  IOS-Resume
//
//  Created by Torear797 on 10.01.2023.
//

import SwiftUI
import Kingfisher

struct KingfisherImage: View {
    let url: URL
    var contentMode: SwiftUI.ContentMode = .fill
    
    var body: some View {
        KFImage.url(url)
            .placeholder({
                ImagePlaceholder()
                    .setContentMode(contentMode)
            })
            .loadDiskFileSynchronously()
            .fade(duration: 0.25)
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

extension KingfisherImage {
    func setContentMode(_ mode: SwiftUI.ContentMode) -> KingfisherImage {
        var result = self
        
        result.contentMode = mode
        
        return result
    }
}
