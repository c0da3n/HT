//
//  SignupView.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        Header(title: "회원가입")
        VStack(spacing:20){
            InputBox(title: "이메일", placeholder: "이메일을 입력해주세요", imageName: "email", isSecure: false)
            InputBox(title: "이름", placeholder: "이름을 입력해주세요", imageName: "user", isSecure: false)
            InputBox(title: "비밀번호", placeholder: "비밀번호를 입력해주세요", imageName: "password", isSecure: true)
            InputBox(title: "비밀번호 확인", placeholder: "비밀번호를 다시 입력해주세요", imageName: "password", isSecure: true)
            SubmitButton(title: "회원가입")
        }.padding(.horizontal, 20).navigationBarHidden(true)
        Spacer()
    }
}

#Preview {
    SignupView()
}
