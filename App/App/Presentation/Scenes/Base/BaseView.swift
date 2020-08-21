//
//  BaseView.swift
//  App
//
//  Created by Luis Eduardo Talavera Rios on 8/19/20.
//  Copyright © 2020 Luis Eduardo Talavera Rios. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import MBProgressHUD
import TTGSnackbar

protocol BaseView: AnyObject {
    func createPresenter<P: BasePresenter>(of type: P.Type) -> P
    func showProgress()
    func hideProgress()
    func showError(error: String)
}

extension BaseView where Self: UIViewController {
    func createPresenter<P>(of type: P.Type) -> P {
        let presenter = Assembler.shared.resolver.resolve(type)!
        (presenter as! BasePresenter).attach(view: self)
        return presenter
    }
    
    func showProgress() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideProgress() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showError(error: String) {
        let snackbar = TTGSnackbar(message: "", duration: .long)
        snackbar.message = error
        snackbar.show()
    }
}
