//
//  User.swift
//  Models
//
//  Created by Andrey Novikov on 1/29/21.
//

import Foundation

public struct User {
    public let email: String
    public let username: String
    
    public init(email: String, username: String) {
        self.email = email
        self.username = username
    }
}
