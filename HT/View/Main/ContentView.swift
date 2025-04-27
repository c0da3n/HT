//
//  ContentView.swift
//  HT
//
//  Created by Jungi Min on 4/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: LoginView()){
                Text("로그인 페이지로 이동")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
