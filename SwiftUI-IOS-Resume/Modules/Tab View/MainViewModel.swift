//
//  MainViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.05.2023.
//

import Combine
import Foundation

final class MainViewModel: ObservableObject {
    
    @Published private(set) var user: User?
    @Published var isShowProfile = false
    
    @Inject private var userRepository: IUserRepository
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        fetchUser()
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
