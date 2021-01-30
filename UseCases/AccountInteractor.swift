//
//  AccountInteractor.swift
//  UseCases
//
//  Created by Andrey Novikov on 1/29/21.
//

import Foundation
import RxSwift
import MyMessageService


public final class AccountInteractor {
    private let webSocketService: ChatroomWebSocetAPI
        
    public init(webSocketService: ChatroomWebSocetAPI) {
        self.webSocketService = webSocketService
    }
}

// MARK: -

public extension AccountInteractor {
    func login(userName: String, email: String) -> Single<()> {
        webSocketService.login(email: email, username: userName)
        return Single<()>.never()
    }
}
 
