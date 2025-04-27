//
//  SubmitButton.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

import SwiftUI

struct SubmitButton: View {
    var title: String
    var body: some View {
        HStack{
           Text(title)
                .font(.PretendardSemiBold16)
        }.frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(.accent)
            .cornerRadius(12)
            .foregroundStyle(.white)
    }
}

#Preview {
    SubmitButton(title:"로그인")
}
