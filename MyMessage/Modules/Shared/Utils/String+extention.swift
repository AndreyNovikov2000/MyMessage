//
//  String+extention.swift
//  Utils
//
//  Created by Andrey Novikov on 1/29/21.
//

import Foundation

public extension String {
    func isEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredecate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredecate.evaluate(with: self)
    }
}
