//
//  ImageFocused.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

import SwiftUI

extension String {
    func focusedImageName(isFocused: Bool) -> String {
        isFocused ? "\(self)_focused" : self
    }
}

