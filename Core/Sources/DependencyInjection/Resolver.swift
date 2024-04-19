//
//  Resolver.swift
//  
//
//  Created by Артём Клыч on 11.09.2023.
//

import Swinject

public final class Resolver {
    public static let shared = Resolver()
    
    private var container = buildContainer()
    
    public func resolve<T>(_ type: T.Type) -> T {
        guard
            let instance = container.resolve(T.self)
        else {
            fatalError("Error: can't resolve instance \(String(describing: T.self))")
        }
        
        return instance
    }
    
    static func buildContainer() -> Container {
        let container = Container()
        
       
        return container
    }
    
    public func setDependencyContainer(_ container: Container) {
        self.container = container
    }
    
    public func getDependencyContainer() -> Container {
        container
    }
}

