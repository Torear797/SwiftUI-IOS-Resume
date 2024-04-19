//
//  DeviceMapper.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import CFFoundation
import DevicesAPI
import Foundation
import WebDataSourceAPI

final class DeviceMapper: Mapper {
    typealias InputType = DeviceEntity
    typealias OutputType = Device
    
    func map(to inputData: InputType) -> OutputType? {
        let preview = getPreview(device: inputData)
        let original = getOriginal(device: inputData)
        let image = ImageSize(preview: preview, original: original)
        let type = map(typeEntity: inputData.type)
        let models = inputData.Models.map({ map(modelEntity: $0) })
        return Device(
            id: inputData.Identifier,
            generation: inputData.Generation,
            aNumber: inputData.ANumber,
            bootrom: inputData.Bootrom,
            fccid: inputData.FCCID,
            internalName: inputData.InternalName,
            price: inputData.price,
            year: inputData.year,
            type: type,
            description: inputData.description,
            models: models,
            image: image
        )
    }
    
    private func map(typeEntity: DeviceEntity.DeviceType) -> Device.DeviceType {
        switch typeEntity {
        case .iphone:
                .iPhone
        case .iPad:
                .iPad
        case .Watch:
                .watch
        }
    }
    
    private func map(modelEntity: DeviceEntity.Model) -> Device.Model {
        Device.Model(
            caseMaterial: modelEntity.CaseMaterial,
            color: modelEntity.Color,
            size: modelEntity.size,
            storage: modelEntity.Storage,
            model: modelEntity.Model
        )
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
    
    private func getOriginal(device: DeviceEntity) -> URL {
        if device.type == .iPad {
            let originalString = "\(BackendConfig.baseURL)/devices/apple/images/original/ipad.png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        } else {
            let originalString = "\(BackendConfig.baseURL)/devices/apple/images/original/\(device.Generation).png"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            return URL(string: urlString)!
        }
    }
}
