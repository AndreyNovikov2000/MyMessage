//
//  Builder.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit
import Utils

public final class Builder {
    public static func build() -> UIViewController {
        let strotyboard = UIStoryboard(name: "ChatroomLogin", bundle: Bundle(for: self))
        let chatroomVieewController = ChatroomLoginViewController.instantiate(from: strotyboard)
        return chatroomVieewController
    }
}
