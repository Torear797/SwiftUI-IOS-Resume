//
//  StoreViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 25.05.2023.
//

import Combine

final class StoreViewModel: ObservableObject {
    
    @Published var selectedTab = 0
    @Published var searchText = ""
    @Published var selectedDevice: DeviceInfo?
    
    @Published private(set) var categories: [Category] = []
    
    @Inject private var repository: IDevicesRepository
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        fetchDevices()
    }
    
    func getItems() -> [DeviceInfo] {
        guard categories.count > selectedTab else { return [] }
        
        let allItems = categories[selectedTab].items
        
        guard !searchText.isEmpty else {
            return allItems
        }
        
        return allItems.filter({
            $0.Generation.localizedCaseInsensitiveContains(searchText) ||
            $0.Identifier.localizedCaseInsensitiveContains(searchText)
        })
    }
    
    private func fetchDevices() {
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
