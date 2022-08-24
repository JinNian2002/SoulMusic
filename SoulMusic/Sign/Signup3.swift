//
//  Signup3.swift
//  SoulMusic
//
//  Created by ZZZS on 23.8.22.
//

import SwiftUI
import Parse
struct Signup3: View {
    @Environment(\.colorScheme) var currentMode
    @Environment(\.dismiss) var dismiss
    @Binding var username : String
    @Binding var password : String
    @Binding var email : String
    @State var emailnum = ""
    @State var emailsite = ""
    @State var success = false
    
    func SignUp(username: String, password: String, email: String) -> Bool{
        var user = PFUser()
        user.username = username
        user.password = password
        user.email = email
        user.signUpInBackground { success, error in
            if(error == nil){
                withAnimation {
                    self.success = true
                }
            }
        }
        return success
    }
    
    var body: some View {
        if success{
            Signin()
        }else{
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
                    Text("完成")
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .foregroundColor(Color("Primary"))
                        .onTapGesture {
                            email = emailnum + "@" + emailsite
                            success = SignUp(username: username, password: password, email: email)
                        }
                }
                .background(Color("Surface"))
                VStack(alignment: .leading, spacing: 21){
                    Text("请填写您的常用电子邮箱")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .medium))
                    HStack{
                        TextField("", text: $emailnum)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 24))
                        Text("@")
                            .font(.system(size: 24))
                        TextField(".com", text: $emailsite)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 24))
                            .frame(width: UIScreen.main.bounds.width / 4)
                    }
                    .foregroundColor(.black)
                }
                .padding(.horizontal, 24)
                Spacer()
            }
            .background(Image("Signup").resizable().aspectRatio(contentMode: .fill))
//            .alert(isPresented: $success) {
//                Alert(title: Text("注册成功！"), message: Text(""), primaryButton: Alert.Button.cancel(Text("取消"), action: {
//                    success = false
//                }), secondaryButton: Alert.Button.default(Text("确定"), action: {
//                    success = false
//                }))
//            }
        }
        
    }
}
