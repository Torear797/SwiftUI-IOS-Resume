//
//  StoreItem.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import DevicesAPI
import SwiftUI

struct StoreItem: View {
    
    // MARK: StateObject
    
    @StateObject private var viewModel: ViewModel
    
    // MARK: Init
    
    init(device: Device) {
        let vm = ViewModel(device: device)
        _viewModel = StateObject(wrappedValue: vm)
    }
       
    // MARK: View
    
    var body: some View {
        HStack {
            image
            info
        }
    }
    
    private var image: some View {
        KingfisherImage(url: viewModel.device.image.preview)
            .frame(width: 70, height: 70)
            .clipShape(.rect(cornerRadius: 8))
    }
    
    private var info: some View {
        VStack(alignment: .leading) {
            Text(viewModel.device.generation)
                .font(.system(size: 12))
                .foregroundStyle(Color.text)
                .lineLimit(2)
            
            Text(viewModel.device.year.description)
                .font(.system(size: 10))
                .foregroundStyle(Color.caption)
            
            Spacer()
            
            buyButton
        }
    }
    
    private var buyButton: some View {
        Button {
            viewModel.didTapBuy()
        } label: {
            Text("\(viewModel.device.price) RUB")
                .fontWeight(.bold)
                .font(.system(size: 10))
                .padding(.horizontal, 5)
                .padding(.vertical, 3)
        }
        .background(Color.background)
        .clipShape(.rect(cornerRadius: 16))
        .alert(isPresented: $viewModel.isShowingAlert) {
            Alert(
                title: Text(LocalizationManager.alertTitle),
                message: Text(LocalizationManager.alertCaption),
                dismissButton: .cancel()
            )
        }
    }
}
