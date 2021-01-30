//
//  Router.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 1/29/21.
//

import UIKit

protocol Routing {
    
}

class Router: Routing {
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

