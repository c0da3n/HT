//
//  InputBox.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

// InputBox.swift

import SwiftUI

struct InputBox: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userName: String = ""
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
    var isSecure: Bool = false
    var isUserField: Bool = false
    
    @State private var emailError: String?
    @State private var passwordError: String?
    @State private var userNameError: String?
    
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
                            TextField(placeholder, text: $password)
                                .focused($isFocused)
                                .font(.PretendardRegular14)
                                .foregroundStyle(.grayRegular14)
                                .textInputAutocapitalization(.never)
                                .onChange(of: password) { oldVlaue, newValue in
                                    passwordError = newValue.isValidPassword ? nil : "Password must be between 6 and 14 characters, with at least one uppercase letter and one special character."
                                }
                        } else {
                            SecureField(placeholder, text: $password)
                                .focused($isFocused)
                                .font(.PretendardRegular14)
                                .foregroundStyle(.grayRegular14)
                                .onChange(of: password) { oldValue, newValue in
                                    passwordError = newValue.isValidPassword ? nil : "Password must be between 6 and 14 characters, with at least one uppercase letter and one special character."
                                }
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
                    if isUserField { // 사용자 이름 필드일 경우
                        TextField(placeholder, text: $userName)
                            .focused($isFocused)
                            .font(.PretendardRegular14)
                            .foregroundStyle(.grayRegular14)
                            .textInputAutocapitalization(.never)
                            .onChange(of: userName) { oldVlaue, newValue in
                                userNameError = newValue.isValidUserName ? nil : "Name must be at least 4 characters long and contain only English letters."
                            }
                    } else {
                        TextField(placeholder, text: $email)
                            .focused($isFocused)
                            .font(.PretendardRegular14)
                            .foregroundStyle(.grayRegular14)
                            .textInputAutocapitalization(.never)
                            .onChange(of: email) { oldVlaue, newValue in
                                emailError = newValue.isValidEmail ? nil : "Invalid email format."
                            }
                    }
                }
            }
            .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
            .background(isFocused ? Color.accent.opacity(0.1) : .white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Color.accent: .grayStrongRegular14, lineWidth: 1)
            )
            
            // 에러 메시지 표시
            if let emailError = emailError {
                Text(emailError)
                    .font(.PretendardRegular14)
                    .foregroundStyle(.red)
                    .padding(.leading, 8)
            }
            
            if let passwordError = passwordError {
                Text(passwordError)
                    .font(.PretendardRegular14)
                    .foregroundStyle(.red)
                    .padding(.leading, 8)
            }
            
            if let userNameError = userNameError { // 사용자 이름 에러 표시
                Text(userNameError)
                    .font(.PretendardRegular14)
                    .foregroundStyle(.red)
                    .padding(.leading, 8)
            }
        }
        .padding(.top, 8)
    }
}

#Preview {
    InputBox(title: "비밀번호", placeholder: "비밀번호를 입력해주세요", imageName: "password", isSecure: true)
}
