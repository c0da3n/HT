//
//  Header.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

import SwiftUI

struct Header: View {
    var title: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    Image("Left").resizable().frame(width: 24, height: 24)
                }
                Spacer()
            }.padding(.leading, 24)
            
            Text(title)
                .font(.PretendardSemiBold20)
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
                .foregroundStyle(.dark)
                .frame(maxWidth: .infinity, maxHeight: 56)
            
        }
    }
}

#Preview {
    Header(title: "로그인")
}
