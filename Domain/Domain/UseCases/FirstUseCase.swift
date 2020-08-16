//
//  FirstUseCase.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/15/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation

public final class FirstUseCase {
    public static let shared = FirstUseCase()
    
    public func testRun() {
        print("Hello World")
    }
}
