//
//  DeviceCategoryMapper.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import CFFoundation
import DevicesAPI
import Foundation
import WebDataSourceAPI

final class DeviceCategoryMapper: Mapper {
    private let deviceMapper = DeviceMapper()
    
    typealias InputType = [DeviceEntity]
    typealias OutputType = [DeviceCategory]
    
    func map(to inputData: InputType) -> OutputType? {
        var categories: [DeviceCategory] = []
        var inputData = inputData.compactMap({ deviceMapper.map(to: $0) })
        
        let iPhones = inputData
            .filter({ $0.type == .iPhone })
            .sorted(by: { $0.year > $1.year })
        
        if !iPhones.isEmpty, let first = iPhones.first {
            categories.append(DeviceCategory(
                name: "iPhones",
                description: "Смартфоны",
                imageURL: first.image.preview,
                devices: iPhones
            ))
        }
        
        let iPads = inputData
            .filter({ $0.type == .iPad })
            .sorted(by: { $0.year > $1.year })
        
        if !iPads.isEmpty, let first = iPads.first {
            categories.append(DeviceCategory(
                name: "iPads",
                description: "Планшеты",
                imageURL: first.image.preview,
                devices: iPads
            ))
        }
        
        let watch = inputData
            .filter({ $0.type == .watch })
            .sorted(by: { $0.year > $1.year })
        
        if !watch.isEmpty, let first = watch.first {
            categories.append(DeviceCategory(
                name: "Watch",
                description: "Часы",
                imageURL: first.image.preview,
                devices: watch
            ))
        }
        
        return categories
    }
    
    private func getPreview(device: DeviceEntity) -> URL {
        if device.type == .iPad {
            let originalString = "\(BackendConfig.baseURL)/devices/apple/images/preview/ipad.png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        } else {
            let originalString = "\(BackendConfig.baseURL)/devices/apple/images/preview/\(device.Generation).png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        }
    }
}
