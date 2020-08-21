//
//  Task.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation

public struct TaskEntity {
    public var title: String
    public var description: String
    public var updated: Date
    public var created: Date
    
    public init(
        title: String = "",
        description: String = "",
        updated: Date = Date(),
        created: Date = Date()
    ){
        self.title = title
        self.description = description
        self.updated = updated
        self.created = created
    }
}

