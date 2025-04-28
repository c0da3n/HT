//
//  InputBox.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

import SwiftUI

struct InputBox: View {
    @State private var email: String = ""
    @State private var isPasswordVisible: Bool = false
    @FocusState private var isFocused: Bool
    
    private var currentImageName: String {
        imageName.focusedImageName(isFocused: isFocused)
    }
    private var currentVisibilityIconNmae: String {
        (isPasswordVisible ? "visible" : "invisible").focusedImageName(isFocused: isFocused)
    }

    var title: String
    var placeholder: String
    var imageName: String
    var isSecure: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.PretendardRegular14)
                .foregroundStyle(.grayRegular14)
                .padding(.leading, 8)
            
            HStack(alignment: .center) {
                Image(currentImageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                if isSecure {
                    Group {
                        if isPasswordVisible {
                            TextField(placeholder, text: $email)
                                .focused($isFocused)
                                .font(.PretendardRegular14)
                                .foregroundStyle(.grayRegular14)
                                .textInputAutocapitalization(.never)
                        } else {
                            SecureField(placeholder, text: $email)
                                .focused($isFocused)
                                .font(.PretendardRegular14)
                                .foregroundStyle(.grayRegular14)
                        }
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                        isFocused=true
                    }) {
                        Image(currentVisibilityIconNmae)
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundStyle(.grayStrongRegular14)
                    }.buttonStyle(.plain).focused($isFocused)
                } else {
                    TextField(placeholder, text: $email)
                        .focused($isFocused)
                        .font(.PretendardRegular14)
                        .foregroundStyle(.grayRegular14)
                        .textInputAutocapitalization(.never)
                }
            }
            .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
            .background(isFocused ? Color.accent.opacity(0.1) : .white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Color.accent: .grayStrongRegular14, lineWidth: 1)
            )
        }
        .padding(.top, 8)
    }
}

#Preview {
    InputBox(title: "비밀번호", placeholder: "비밀번호를 입력해주세요", imageName: "password", isSecure: true)
}
