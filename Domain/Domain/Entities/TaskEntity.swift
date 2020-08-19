//
//  Task.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation

public struct TaskEntity {
    var id: Int? = nil
    var title: String
    var description: String
    var updated: Date
    var created: Date
    
    public init(id: Int?, title: String, description: String, updated: Date, created: Date){
        self.id = id
        self.title = title
        self.description = description
        self.updated = updated
        self.created = created
    }
}

