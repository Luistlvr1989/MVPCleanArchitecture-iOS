//
//  CompletableUseCase.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift

public protocol CompletableUseCase {
    associatedtype Input
    
    var backgroundScheduler: SchedulerType { get }
    var foregroundScheduler: SchedulerType { get }
    
    func generateCompletable(input: Input?) -> Completable
}

public extension CompletableUseCase {
    func buildUseCase(input: Input? = nil) -> Completable {
        return generateCompletable(input: input)
            .subscribeOn(backgroundScheduler)
            .observeOn(foregroundScheduler)
    }
}
