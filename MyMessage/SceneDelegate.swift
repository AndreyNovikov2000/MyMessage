//
//  SceneDelegate.swift
//  MyMessage
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import Window

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = Window.Builder.build(windowScene: windowScene)
    }
}

