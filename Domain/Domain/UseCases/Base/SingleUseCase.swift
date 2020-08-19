//
//  SingleUseCase.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift

public protocol SingleUseCase {
    associatedtype Input
    associatedtype T
    
    var backgroundScheduler: SchedulerType { get }
    var foregroundScheduler: SchedulerType { get }
    
    func generateSingle(input: Input?) -> Single<T>
}

public extension SingleUseCase {    
    func buildUseCase(input: Input? = nil) -> Single<T> {
        return generateSingle(input: input)
            .subscribeOn(backgroundScheduler)
            .observeOn(foregroundScheduler)
    }
}
