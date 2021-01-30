//
//  ChatroomWebSocetService.swift
//  MyMessageService
//
//  Created by Andrey Novikov on 1/30/21.
//

import Foundation
import SocketIO

public protocol ChatroomWebSocetAPI {
    func login(email: String, username: String)
}


public class ChatroomWebSocetService {
    private let socketURLSring: String
    private var socketManager: SocketManager!
    private var socket: SocketIOClient!
    
    public init(socketURLSring: String) {
        self.socketURLSring = socketURLSring
        
        let socketURL = URL(string: socketURLSring)!
        setup(usingSocketURL: socketURL)
    }
    
    deinit {
        socket.disconnect()
    }
}


// MARK: - ChatroomWebSocetAPI

extension ChatroomWebSocetService: ChatroomWebSocetAPI {
    public func login(email: String, username: String) {
        socket.emit("login", username, email)
    }
}

extension ChatroomWebSocetService {
    func setup(usingSocketURL socketURL: URL) {
        socketManager = SocketManager(socketURL: socketURL)
        socket = socketManager.defaultSocket
        socket.connect()
        
        socket.on("loginResponse") { (dataArray, socketAck) in
            print(dataArray)
            print(socketAck)
        }
    }
}
