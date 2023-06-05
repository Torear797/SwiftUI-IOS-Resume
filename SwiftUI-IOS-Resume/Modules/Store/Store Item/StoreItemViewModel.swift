//
//  StoreItemViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 30.05.2023.
//

import Foundation

final class StoreItemViewModel: ObservableObject {
    
    let device: DeviceInfo
    
    @Inject private var userDefaultManager: IUserDefaultManager
    
    @Published var balance: Float = 0.0 {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.userDefaultManager.setBalance(value: self.balance)
            }
        }
    }
    
    @Published var isShowingAlert = false
    
    init(device: DeviceInfo) {
        self.device = device
    }
    
    func didTapBuy() {
        balance = userDefaultManager.getBalance()
        guard balance - Float(device.price) >= 0 else {
            isShowingAlert = true
            return
        }
        balance -= Float(device.price)
    }
}
