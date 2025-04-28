//
//  UserVlidator.swift
//  HT
//
//  Created by Jungi Min on 4/28/25.
//

import Foundation

extension String {
    var isValidUserName: Bool {
        let userNameRegex = "[A-Za-z]{4,}$"
        return NSPredicate(format: "SELF MATCHES %@", userNameRegex).evaluate(with: self)
    }
}
