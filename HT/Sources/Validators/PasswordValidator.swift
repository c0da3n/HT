//
//  PasswordValidator.swift
//  HT
//
//  Created by Jungi Min on 4/28/25.
//

import Foundation

extension String {
    var isValidPassword: Bool {
        let passwordRegex = #"^(?=.*[A-Z])(?=.*[!@#$&*]).{6,14}$"#
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}
