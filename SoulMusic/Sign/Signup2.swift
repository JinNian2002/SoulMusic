//
//  Signup2.swift
//  SoulMusic
//
//  Created by ZZZS on 23.8.22.
//

import SwiftUI
import Parse
struct Signup2: View {
    @Environment(\.colorScheme) var currentMode
    @Environment(\.dismiss) var dismiss
    @Binding var username : String
    @Binding var password : String
    @Binding var email : String
    var body: some View {
        VStack(spacing: 48){
            HStack{
                Image(currentMode == .dark ? "chevron_24_back_dm" : "chevron_24_back")
                    .padding(12)
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
                Text("注册")
                    .font(.system(size: 17, weight: .medium))
                Spacer()
                NavigationLink{
                    Signup3(username: $username, password: $password, email: $email)
                        .navigationBarHidden(true)
                }label: {
                    Text("继续")
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .foregroundColor(Color("Primary"))
                }
            }
            .background(Color("Surface"))
            VStack(alignment: .leading, spacing: 21){
                Text("请设置您的密码")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .medium))
                SecureField("", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 24))
            }
            .padding(.horizontal, 24)
            Spacer()
        }
        .background(Image("Signup").resizable().aspectRatio(contentMode: .fill))
    }
}
