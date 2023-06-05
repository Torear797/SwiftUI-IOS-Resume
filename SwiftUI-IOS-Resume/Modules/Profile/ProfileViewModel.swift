//
//  ProfileViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.05.2023.
//

import Combine
import Foundation

final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: User?
    
    @Inject private var userRepository: IUserRepository
    @Inject private var userDefaultManager: IUserDefaultManager
    
    @Published var balance: Float = 0.0 {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.userDefaultManager.setBalance(value: self.balance)
            }
        }
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        fetchUser()
        balance = userDefaultManager.getBalance()
    }
    
    var userFIO: String {
        guard let user else { return "" }
        return user.fio
    }
    
    var userGitHub: String {
        guard let user else { return "" }
        return user.gitHub
    }
    
    private func fetchUser() {
        userRepository.getUser()
            .removeDuplicates()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] user in
                guard let self else { return }
                self.user = user
            })
            .store(in: &cancellableSet)
    }
}
