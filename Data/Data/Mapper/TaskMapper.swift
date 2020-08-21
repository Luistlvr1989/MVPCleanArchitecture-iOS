//
//  TaskMapper.swift
//  Data
//
//  Created by Luis Eduardo Talavera Rios on 8/20/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Domain

public extension TaskDto {
    func toEntity() -> TaskEntity {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return TaskEntity(
            id: self.id,
            title: self.title,
            description: self.description,
            updated: dateFormatter.date(from: self.updated)!,
            created: dateFormatter.date(from: self.created)!
        )
    }
}

extension Task {
    func fromEntity(entity: TaskEntity) {
        id = Int64(entity.id!)
        title = entity.title
        detail = entity.description
        modified = entity.updated
        created = entity.created
    }
    
    func toEntity() -> TaskEntity {
        return TaskEntity(
            id: Int(self.id),
            title: self.title!,
            description: self.detail!,
            updated: self.modified!,
            created: self.created!
        )
    }
}

