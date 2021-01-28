//
//  Router.swift
//  Window
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit

protocol Routing {
    func routeToLanding()
}

class Router: Routing {
    typealias Modules = (landingModule: () -> UIViewController, ())
    
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
        let landingViewController = modules.landingModule()
        window.rootViewController = landingViewController
        window.makeKeyAndVisible()
    }
}
