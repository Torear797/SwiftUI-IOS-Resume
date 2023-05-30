//
//  CircleButtonView.swift
//  PlaceDitails
//
//  Created by Ульяна Гритчина on 16.12.2022.
//

import SwiftUI

struct CircleButtonView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let imageName: String
    
    init(imageName: String = "chevron.left") {
        self.imageName = imageName
    }
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Circle()
                .fill(.white)
                .frame(width: 36, height: 36)
                .overlay {
                    Image(systemName: imageName)
                        .font(.headline)
                        .imageScale(.medium)
                        .foregroundColor(.black)
                }
        }
    }
}

#if DEBUG
struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView()
    }
}
#endif
