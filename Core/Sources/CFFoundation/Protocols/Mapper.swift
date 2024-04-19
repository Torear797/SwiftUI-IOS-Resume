//
//  Mapper.swift
//  
//
//  Created by Артём Клыч on 07.08.2023.
//

import Foundation

public protocol Mapper {
    associatedtype InputType
    associatedtype OutputType
    
    func map(to inputData: InputType) -> OutputType?
}
