//
//  DeviceDetail.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import DevicesAPI
import SwiftUI

struct DeviceDetail: View {
    
    // MARK: Constants
    
    private let paralaxHeaderHeight: CGFloat = 300
    private let coordinateSpace = "DeviceDetailScrollView"
    private let device: Device
    private let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    
    // MARK: Environment
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: State
    
    @State private var hideNavigationBar = false
    @State private var scrollOffset: CGFloat = 0.0
    
    // MARK: Init
    
    init(device: Device) {
        self.device = device
    }
    
    // MARK: View
    
    var body: some View {
        mainView
            .navigationTitle(device.generation)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(hideNavigationBar)
            .animation(.default, value: hideNavigationBar)
            .overlay(alignment: .topLeading) { backButton }
            .onAppear() {
                updateNavigationBar(offset: scrollOffset)
            }
            .onDisappear() {
                hideNavigationBar = false
            }
    }
    
    private var mainView: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: .zero) {
                ParallaxHeader(
                    coordinateSpace: coordinateSpace,
                    defaultHeight: paralaxHeaderHeight
                ) {
                    image
                }
                scrollContent
            }
        }
        .coordinateSpace(name: coordinateSpace)
        .ignoresSafeArea(edges: .top)
        .onPreferenceChange(ViewOffsetKey.self) { newValue in
            withAnimation {
                updateNavigationBar(offset: newValue)
            }
        }
    }
    
    private var image: some View {
        KingfisherImage(url: device.image.preview)
            .frame(maxWidth: .infinity, minHeight: paralaxHeaderHeight)
            .clipShape(.rect)
    }
    
    private var scrollContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(device.description ?? loremIpsum)
            Text(device.description ?? loremIpsum)
            Text(device.description ?? loremIpsum)
            Text(device.description ?? loremIpsum)
        }
        .font(.body)
        .foregroundStyle(Color.text)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        .background(.white)
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Circle()
                .fill(.white)
                .frame(width: 36, height: 36)
                .overlay {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .imageScale(.medium)
                        .foregroundColor(.black)
                }
        }
        .scaleEffect(hideNavigationBar ? 1.0 : 0.001)
        .frame(width: 50, height: 50, alignment: .topLeading)
        .padding(.vertical, 11)
        .padding(.horizontal, 16)
        .background(Color.black.opacity(0.001))
        .edgesIgnoringSafeArea(hideNavigationBar ? .bottom : .top)
    }
    
    // MARK: Private Methods
    
    private func updateNavigationBar(offset: CGFloat) {
        let newValue = isHiddenNavBar(offset: offset)
        guard newValue != hideNavigationBar else { return }
        scrollOffset = offset
        hideNavigationBar = newValue
    }
    
    private func isHiddenNavBar(offset: CGFloat) -> Bool {
        offset < (paralaxHeaderHeight - 50)
    }
}
