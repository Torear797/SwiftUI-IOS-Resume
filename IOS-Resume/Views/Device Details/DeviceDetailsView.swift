//
//  DeviceDetailsView.swift
//  IOS-Resume
//
//  Created by Torear797 on 25.05.2023.
//

import SwiftUI

struct DeviceDetailsView: View {
    
    @StateObject private var viewModel: DeviceDetailsViewModel
    
    @State private var hideNavigationBar = false
    @State private var scrollOffset: CGFloat = 0.0

    init(device: DeviceInfo) {
        let vm = DeviceDetailsViewModel(device: device)
        _viewModel = StateObject(wrappedValue: vm)
    }
    
    private func updateNavigationBar(offset: CGFloat) {
        let newValue = viewModel.isHiddenNavBar(offset: offset)
        guard newValue != hideNavigationBar else { return }
        scrollOffset = offset
        hideNavigationBar = newValue
    }
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    var body: some View {
        mainView
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.top)
            .navigationTitle(viewModel.device.Generation)
            .navigationBarHidden(hideNavigationBar)
            .overlay(alignment: .topLeading) {
                CircleButtonView()
                    .scaleEffect(hideNavigationBar ? 1.0 : 0.001)
                    .frame(width: 50, height: 50, alignment: .topLeading)
                    .padding(.vertical, 11)
                    .padding(.horizontal, 16)
                    .background(Color.black.opacity(0.001))
                    .edgesIgnoringSafeArea(hideNavigationBar ? .bottom : .top)
            }
            .animation(.default, value: hideNavigationBar)
            .onAppear() {
                updateNavigationBar(offset: scrollOffset)
            }
            .onDisappear() {
                hideNavigationBar = false
            }
    }
    
    private var mainView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ParallaxHeader(
                coordinateSpace: CoordinateSpaces.scrollView,
                defaultHeight: viewModel.paralaxHeaderHeight
            ) {
                image
            }
            
            scrollContent
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .coordinateSpace(name: CoordinateSpaces.scrollView)
        .onPreferenceChange(ViewOffsetKey.self) { newValue in
             DispatchQueue.main.async {
                 withAnimation {
                     updateNavigationBar(offset: newValue)
                 }
             }
         }
    }
    
    private var image: some View {
        KingfisherImage(url: viewModel.device.originalURL, contentMode: .fit)
            .clipShape(Rectangle())
            .clipped()
    }
    
    private var scrollContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.description)

            Text(viewModel.loremIpsum)
            
            Spacer()
        }
        .font(.body)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
    
}
