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
                Image(imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                if isSecure {
                    Group {
                        if isPasswordVisible {
                            TextField(placeholder, text: $email)
                                .font(.PretendardRegular14)
                                .foregroundStyle(.grayRegular14)
                                .textInputAutocapitalization(.never)
                        } else {
                            SecureField(placeholder, text: $email)
                                .font(.PretendardRegular14)
                                .foregroundStyle(.grayRegular14)
                        }
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(isPasswordVisible ? "visible" : "invisible")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundStyle(.grayStrongRegular14)
                    }
                } else {
                    TextField(placeholder, text: $email)
                        .font(.PretendardRegular14)
                        .foregroundStyle(.grayRegular14)
                        .textInputAutocapitalization(.never)
                }
            }
            .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.grayStrongRegular14, lineWidth: 1)
            )
        }
        .padding(.top, 8)
    }
}

#Preview {
    InputBox(title: "비밀번호", placeholder: "비밀번호를 입력해주세요", imageName: "password", isSecure: true)
}
