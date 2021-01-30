//
//  Builder.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import Utils
import UseCases

public final class Builder {
    public static func build() -> UIViewController {
        let strotyboard = UIStoryboard(name: "ChatroomLogin", bundle: Bundle(for: self))
        let chatroomVieewController = ChatroomLoginViewController.instantiate(from: strotyboard)
        let router = Router(viewController: chatroomVieewController)
        let accountInteractor = UseCassesFactory.accountInteractor
        
        chatroomVieewController.presenterProduces = { input in
            let userCasses = (login: accountInteractor.login,
                              ())
            
            let presenter = Presenter(input: input, router: router, useCases: userCasses)
            return presenter
        }
        
        
        return chatroomVieewController
    }
}


