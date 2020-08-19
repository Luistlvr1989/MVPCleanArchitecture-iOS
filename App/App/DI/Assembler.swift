//
//  DependencyProvider.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Swinject

extension Assembler {
    static let shared: Assembler = {
        let container = Container()
        let assembler = Assembler(
            [
                DataAssembly(),
                DomainAssembly()
            ],
            container: container
        )
        
        return assembler
    }()
}
