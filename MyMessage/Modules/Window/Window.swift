//
//  Window.swift
//  Window
//
//  Created by Andrey Novikov on 1/28/21.
//

import UIKit


class Window: UIWindow {
    var prersenter: Presentation?
    
    // MARK: - Init
    
    override init(windowScene: UIWindowScene) {
        super.init(windowScene: windowScene)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
