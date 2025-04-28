//
//  LoginView.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        Header(title: "로그인")
        VStack(spacing:20){
            InputBox(title: "이메일", placeholder: "이메일을 입력해주세요", imageName: "email")
            InputBox(title: "비밀번호", placeholder: "비밀번호를 입력해주세요", imageName: "password", isSecure: true)
            VStack(spacing: 10){
                SubmitButton(title: "로그인")
                Text("or")
                    .font(.PretendardMedium14)
                    .foregroundStyle(.grayBorder)
                ZStack{
                    HStack{
                        Image("google")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Spacer()
                    }.padding(.leading, 80)
                    HStack {
                        Text("구글 계정으로 로그인")
                            .font(.PretendardSemiBold16)
                    }.frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .foregroundStyle(.dark)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.grayStrongRegular14, lineWidth: 1)
                        )
                }
            }.padding(.top, 40)
        }.padding(.horizontal, 20).navigationBarHidden(true)
        Spacer()
        HStack{
            Text("아직 회원이 아니신가요?")
                .font(.PretendardRegular14)
                .foregroundStyle(.grayRegular14)
            NavigationLink(destination: SignupView()){
                Text("회원가입")
                    .font(.PretendardMedium14)
                    .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    LoginView()
}
