//
//  BasePresenter.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/19/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import RxSwift

protocol BasePresenter: AnyObject {
    var bag: DisposeBag { get }
    
    func attach<View: BaseView>(view: View)
}


