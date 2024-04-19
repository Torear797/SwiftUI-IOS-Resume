//
//  ProfileViewModel.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DependencyInjection
import Foundation
import ProfileAPI
import UserDefaultManagerAPI

extension ProfileView {
    @MainActor final class ViewModel: ObservableObject {
        
        // MARK: Published
        
        @Published private(set) var user: User?
        
        @Published var balance: Float = 0.0 {
            didSet {
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.userDefaultManager.set(balance, forKey: .storeBalance)
                }
            }
        }
        
        // MARK: DI
        
        @Inject private var repository: UserRepository
        @Inject private var userDefaultManager: UserDefaultManager
        
        // MARK: Init
        
        init() {
            getUser()
            balance = userDefaultManager.getFloatValue(forKey: .storeBalance)
        }
        
        // MARK: Private Methods
        
        private func getUser() {
            Task {
                self.user = try await repository.getUser()
            }
        }
    }
}
