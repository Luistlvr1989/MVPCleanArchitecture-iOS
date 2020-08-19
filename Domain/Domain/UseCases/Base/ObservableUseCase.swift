//
//  ObservableUseCase.swift
//  Domain
//
//  Created by Luis Eduardo Talavera Rios on 8/18/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift

public protocol ObservableUseCase {
    associatedtype Input
    associatedtype T
    
    var backgroundScheduler: SchedulerType { get }
    var foregroundScheduler: SchedulerType { get }
    
    func generateObservable(input: Input?) -> Observable<T>
}

public extension ObservableUseCase {
    func buildUseCase(input: Input? = nil) -> Observable<T> {
        return generateObservable(input: input)
            .subscribeOn(backgroundScheduler)
            .observeOn(foregroundScheduler)
    }
}
