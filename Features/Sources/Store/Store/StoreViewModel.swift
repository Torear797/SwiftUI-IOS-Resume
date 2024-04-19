//
//  StoreViewModel.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import CFFoundation
import DependencyInjection
import DevicesAPI
import Foundation

extension StoreView {
    @MainActor final class ViewModel: RootViewModel {
       
        // MARK: Constants
        
        let topViewID = "StoreTopView"
        
        // MARK: Published
        
        @Published private(set) var categories: [DeviceCategory] = []
        
        @Published var selectedTab = 0
        @Published var searchText = ""
        
        // MARK: DI
        
        @Inject private var repository: DevicesRepository
        
        // MARK: Computed Property
        
        var currentCategory: DeviceCategory {
            categories[selectedTab]
        }
        
        var displayedDevices: [Device] {
            guard !categories.isEmpty else { return [] }
            
            let allItems = currentCategory.devices
            
            guard !searchText.isEmpty else {
                return allItems
            }
            
            return allItems.filter({
                $0.generation.localizedCaseInsensitiveContains(searchText) ||
                $0.id.localizedCaseInsensitiveContains(searchText)
            })
        }
        
        // MARK: Init
        
        init() {
            getCategories()
        }
        
        // MARK: Private Methods
        
        private func getCategories() {
            Task {
                self.categories = try await repository.getDeviceCategories()
            }
        }
    }
}
