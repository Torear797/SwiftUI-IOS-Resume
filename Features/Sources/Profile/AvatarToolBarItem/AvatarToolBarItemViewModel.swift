//
//  AvatarToolBarItemViewModel.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DependencyInjection
import Foundation
import ProfileAPI

extension AvatarToolBarItem {
    @MainActor final class ViewModel: ObservableObject {
        
        // MARK: Published
        
        @Published private(set) var user: User?
        
        @Published var isShowProfile = false
        
        // MARK: DI
        
        @Inject private var repository: UserRepository
        
        // MARK: Init
        
        init() {
            getUser()
        }
        
        // MARK: Public Methods
        
        func didTapAvatar() {
            isShowProfile = true
        }
        
        // MARK: Private Methods
        
        private func getUser() {
            Task {
                self.user = try await repository.getUser()
            }
        }
    }
}
