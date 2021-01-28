//
//  Presenter.swift
//  Window
//
//  Created by Andrey Novikov on 1/28/21.
//

import Foundation

protocol Presentation {
    
}

class Presenter: Presentation {
    let router: Routing
    
    // MARK: - Init
    
    init(router: Routing) {
        self.router = router
        process()
    }
}

// MARK: - Private methods

private extension Presenter {
    func process() {
        router.routeToLanding()
    }
}
