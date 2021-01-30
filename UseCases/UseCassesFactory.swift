//
//  UseCassesFactory.swift
//  UseCases
//
//  Created by Andrey Novikov on 1/30/21.
//

import MyMessageService

public final class UseCassesFactory {
    
    // Account interactor
    
    private static let deployedURL = "https://damp-beach-81446.herokuapp.com/"
    private static let webSocketService = ChatroomWebSocetService(socketURLSring: deployedURL)
    public static let accountInteractor = AccountInteractor(webSocketService: webSocketService)
    
    // MARK: - Init
    
    public init() {}
    
    // TODO: create more static usebility funtion
    
}
