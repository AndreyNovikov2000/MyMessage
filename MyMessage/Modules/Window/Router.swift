//
//  Router.swift
//  Window
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit

protocol Routing {
    func routeToLanding()
    func routeToLogin()
}

class Router: Routing {
    typealias Modules = (landingModule: (_ onStart:@escaping () -> Void) -> UIViewController, loginModule: () -> UIViewController)
    
    private unowned let window: UIWindow
    private let modules: Modules
    
    // MARK: - Init
    
    init(window: UIWindow, modules: Modules) {
        self.window = window
        self.modules = modules
    }
}


extension Router {
    func routeToLanding() {
        let landingViewController = modules.landingModule { [weak self] in
            self?.routeToLogin()
        }
        
        window.rootViewController = landingViewController
        window.makeKeyAndVisible()
    }
    
    func routeToLogin() {
        let loginModule = modules.loginModule()
        window.rootViewController = loginModule
    }
}
