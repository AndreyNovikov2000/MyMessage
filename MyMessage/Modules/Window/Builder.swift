//
//  Builder.swift
//  Window
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import Landing
import ChatroomLogin

final public class Builder {
    public static func build(windowScene: UIWindowScene) -> UIWindow {
        let window = Window(windowScene: windowScene)
        
        let landingViewController = Landing.Builder.build
        let chatRoomLogin = ChatroomLogin.Builder.build
        

        let modules: Router.Modules = (landingModule: landingViewController,
                                       loginModule: chatRoomLogin)

        let router = Router(window: window, modules: modules)
        let presenter = Presenter(router: router)

        window.prersenter = presenter
        return window
    }
}
