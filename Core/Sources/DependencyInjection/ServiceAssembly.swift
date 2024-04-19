//
//  ServiceAssembly.swift
//
//
//  Created by Артём Клыч on 22.12.2023.
//

import Swinject

public protocol ServiceAssembly {
    func register(container: Container)
}
