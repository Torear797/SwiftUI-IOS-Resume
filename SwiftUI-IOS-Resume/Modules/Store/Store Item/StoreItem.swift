//
//  StoreItem.swift
//  IOS-Resume
//
//  Created by Torear797 on 26.05.2023.
//

import SwiftUI

struct StoreItem: View {
    
    @StateObject private var viewModel: StoreItemViewModel
    
    init(device: DeviceInfo) {
        let vm = StoreItemViewModel(device: device)
        _viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        HStack {
            image
            info
        }
        .alert(isPresented: $viewModel.isShowingAlert) {
            Alert(
                title: Text("You don't have enough money to buy"),
                message: Text("Top up your balance in your personal account"),
                dismissButton: .cancel()
            )
        }
    }
    
    private var image: some View {
        KingfisherImage(url: viewModel.device.previewURL)
            .frame(width: 70, height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var info: some View {
        VStack(alignment: .leading) {
            Text(viewModel.device.Generation)
                .font(.system(size: 12))
                .foregroundColor(Color("Text"))
                .lineLimit(2)
            
            Text(viewModel.device.year.description)
                .font(.system(size: 10))
                .foregroundColor(Color("Description"))
            
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
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("background"))
        }
    }
}
