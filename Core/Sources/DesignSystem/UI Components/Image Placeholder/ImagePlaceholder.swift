//
//  ImagePlaceholder.swift
//
//
//  Created by Артём Клыч on 11.01.2023.
//

import SwiftUI

public struct ImagePlaceholder: View {
    var contentMode: SwiftUI.ContentMode
    
    public init(contentMode: SwiftUI.ContentMode = .fill) {
        self.contentMode = contentMode
    }
    
    public var body: some View {
        Image("imagePlaceholder", bundle: .module)
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

public extension ImagePlaceholder {
    func setContentMode(_ mode: SwiftUI.ContentMode) -> ImagePlaceholder {
        var result = self
        result.contentMode = mode
        return result
    }
}
