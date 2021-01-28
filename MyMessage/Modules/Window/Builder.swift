//
//  Builder.swift
//  Window
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import Landing

final public class Builder {
    public static func build(windowScene: UIWindowScene) -> UIWindow {
        let window = Window(windowScene: windowScene)
        let landingViewController = Landing.Builder.build()

        let modules: Router.Modules = (landingModule: {
            return landingViewController
        }, ())

        let router = Router(window: window, modules: modules)
        let presenter = Presenter(router: router)

        window.prersenter = presenter
        return window
    }
}
