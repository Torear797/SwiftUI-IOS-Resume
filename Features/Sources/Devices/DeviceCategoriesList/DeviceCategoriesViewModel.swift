//
//  DeviceCategoriesViewModel.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import CFFoundation
import DependencyInjection
import DevicesAPI
import Foundation

extension DeviceCategoriesList {
    @MainActor final class ViewModel: RootViewModel {
        
        // MARK: Constants
        
        let topViewID = "DeviceCategoriesTopView"
        
        // MARK: Published
        
        @Published private(set) var categories: [DeviceCategory] = []
        
        // MARK: DI
        
        @Inject private var repository: DevicesRepository
        
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
