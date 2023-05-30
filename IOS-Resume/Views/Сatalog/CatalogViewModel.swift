//
//  CatalogViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.01.2023.
//

import Combine

final class CatalogViewModel: ObservableObject {
    
    @Published private(set) var categories: [Category] = []
    
    @Inject private var repository: IDevicesRepository
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        getDevices()
    }
    
    private func getDevices() {
        repository.getAppleDevices()
            .removeDuplicates()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] devicesAnswer in
                guard let self else { return }
                createCategory(devices: devicesAnswer)
            })
            .store(in: &cancellableSet)
    }
    
    private func createCategory(devices: [DeviceInfo]) {
        let newCategories: [Category] = devices.getCategories()
        
        guard newCategories != categories else { return }
        categories = newCategories
    }
}
