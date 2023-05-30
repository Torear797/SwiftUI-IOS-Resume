//
//  ImagePlaceholder.swift
//  IOS-Resume
//
//  Created by Torear797 on 11.01.2023.
//

import SwiftUI

struct ImagePlaceholder: View {
    var contentMode: SwiftUI.ContentMode = .fill
    
    var body: some View {
        Image("imagePlaceholder")
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

extension ImagePlaceholder {
    func setContentMode(_ mode: SwiftUI.ContentMode) -> ImagePlaceholder {
        var result = self
        
        result.contentMode = mode
        
        return result
    }
}
