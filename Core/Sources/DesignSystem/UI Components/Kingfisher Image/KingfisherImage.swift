//
//  KingfisherImage.swift
//
//
//  Created by Артём Клыч on 10.01.2023.
//

import SwiftUI
import Kingfisher

public struct KingfisherImage: View {
    let url: URL
    var contentMode: SwiftUI.ContentMode
    var isHiddenPlaceholder = false
    
    public init(url: URL, contentMode: SwiftUI.ContentMode = .fill, isHiddenPlaceholder: Bool = false) {
        self.url = url
        self.contentMode = contentMode
        self.isHiddenPlaceholder = isHiddenPlaceholder
    }
    
    public var body: some View {
        KFImage.url(url)
            .placeholder({
                if !isHiddenPlaceholder {
                    ImagePlaceholder()
                        .setContentMode(contentMode)
                        .clipped()
                }
            })
            .fade(duration: 0.25)
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

public extension KingfisherImage {
    func setContentMode(_ mode: SwiftUI.ContentMode) -> KingfisherImage {
        var result = self
        
        result.contentMode = mode
        
        return result
    }
    
    func hidePlaceholder() -> KingfisherImage {
        var result = self
        
        result.isHiddenPlaceholder = true
        
        return result
    }
}
