//
//  TaskDto.swift
//  Data
//
//  Created by Luis Eduardo Talavera Rios on 8/20/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import Mapper

public struct TaskDto: Mappable {
    let id: Int
    let title: String
    let description: String
    let created: String
    let updated: String
    
    public init(map: Mapper) throws {
        try id = map.from("id")
        try title = map.from("title")
        try description = map.from("description")
        try updated = map.from("updated")
        try created = map.from("created")
    }
}
