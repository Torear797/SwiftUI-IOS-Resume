//
//  StoreItemViewModel.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DependencyInjection
import DevicesAPI
import Foundation
import UserDefaultManagerAPI

extension StoreItem {
    @MainActor final class ViewModel: ObservableObject {
     
        // MARK: Constants
        
        let device: Device
        
        @Published var balance: Float = 0.0 {
            didSet {
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.userDefaultManager.set(balance, forKey: .storeBalance)
                }
            }
        }
        
        @Published var isShowingAlert = false
        
        // MARK: DI
        
        @Inject private var userDefaultManager: UserDefaultManager
        
        // MARK: Init
        
        init(device: Device) {
            self.device = device
        }
        
        // MARK: Public Methods
        
        func didTapBuy() {
            balance = userDefaultManager.getFloatValue(forKey: .storeBalance)
            guard balance - Float(device.price) >= 0 else {
                isShowingAlert = true
                return
            }
            balance -= Float(device.price)
        }
    }
}
