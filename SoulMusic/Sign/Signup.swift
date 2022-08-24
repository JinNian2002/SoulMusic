//
//  SIgnup.swift
//  SoulMusic
//
//  Created by ZZZS on 23.8.22.
//

import SwiftUI
import Parse

struct Signup: View {
    @Environment(\.colorScheme) var currentMode
    @Environment(\.dismiss) var dismiss
    @State var username = ""
    @State var password = ""
    @State var email = ""
    
    
    
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
                    Signup2(username: $username, password: $password, email: $email)
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
                Text("请设置您的用户名")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .medium))
                TextField("", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 24))
            }
            .padding(.horizontal, 24)
            Spacer()
        }
        .background(Image("Signup").resizable().aspectRatio(contentMode: .fill))
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
            .environmentObject(Model())
    }
}
