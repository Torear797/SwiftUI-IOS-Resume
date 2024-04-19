//
//  AvatarToolBarItem.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import SwiftUI

public struct AvatarToolBarItem: View {
    
    // MARK: StateObject
    
    @StateObject private var viewModel = ViewModel()
    
    // MARK: Init
    
    public init() {}
    
    // MARK: View
    
    public var body: some View {
        Button {
            viewModel.didTapAvatar()
        } label: {
            if let url = viewModel.user?.avatarURL {
                KingfisherImage(url: url, contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .clipShape(.circle)
            } else {
                Circle()
                    .fill(.cyan)
                    .frame(width: 30, height: 30)
            }
        }
        .sheet(isPresented: $viewModel.isShowProfile) {
            ProfileView()
        }
    }
}
