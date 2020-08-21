//
//  DataAssembly.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Swinject
import Domain
import Data

class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TaskLocalDataSource.self) { r in
            return TaskLocalDataSourceImpl()
        }
        
        container.register(TaskRemoteDataSource.self) { r in
            return TaskRemoteDataSourceImpl()
        }
        
        container.register(TaskRepository.self) { r in
            return TaskRepositoryImpl(
                localDataSource: r.resolve(TaskLocalDataSource.self)!,
                remoteDataSource: r.resolve(TaskRemoteDataSource.self)!
            )
        }
    }
}
