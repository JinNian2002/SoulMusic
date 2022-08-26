//
//  Signin.swift
//  SoulMusic
//
//  Created by ZZZS on 23.8.22.
//

import SwiftUI
import Parse
struct Signin: View {
    @State var username = ""
    @State var password = ""
    @AppStorage("islogin") var islogin = false
    @State var correct = false
    @EnvironmentObject var MyClientdata : ClientData
    func SignIn(username: String, password: String) -> Bool{
        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if(user != nil){
                withAnimation {
                    print("登录成功！")
                    let username = user!["username"] as! String
                    let email = user!["email"] as! String
                    let sex = user!["sex"] as! String
                    let constellation = user!["constellation"] as! String
                    let age = user!["age"] as! String
                    let location = user!["location"] as! String
                    let job = user!["job"] as! String
                    let introduction = user!["introduction"] as! String
                    let clientimage = user!["clientimage"] as! PFFileObject
                    let clientimagedata = try! clientimage.getData()
                    MyClientdata.MyClient = Client(username: username, email: email, sex: sex, constellation: constellation, age: age, location: location, job: job, introduction: introduction, clientimage: clientimagedata)
                    MyClientdata.datastore()
                    islogin = true
                    print(MyClientdata.MyClient)
                }
            }
        }
        return islogin
    }
    
    var body: some View {
        VStack{
            NavView(isshowfront: false, Navtitle: "登录")
                .background(Color("Surface"))
            VStack(spacing: 12){
                Image("Logo_text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 3)
                Text("高山流水，难遇知音")
                    .foregroundColor(Color("OnSurface"))
            }
            .padding(.top, 30)
            .padding(.bottom, 37)
            VStack(alignment: .trailing){
                VStack(alignment: .leading, spacing: 18){
                    VStack(alignment: .leading, spacing: 6){
                        Text("用户名/Username：")
                        TextField("", text: $username)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 36)
                    }
                    VStack(alignment: .leading, spacing: 6){
                        Text("密码/Password：")
                        SecureField("", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 36)
                    }
                }
                .font(.system(size: 14))
                Text("忘记密码？")
                    .font(.system(size: 14))
                    .foregroundColor(Color("FontSecondary"))
            }
            .padding(.horizontal, 24)
            Spacer()
            Spacer()
            HStack(spacing: 20){
                HStack{
                    Image("qq")
                }
                .circleIcon(width: 40, height: 40)
                HStack{
                    Image("wechat")
                }
                .circleIcon(width: 40, height: 40)
                HStack{
                    Image(systemName: "applelogo")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                }
                .circleIcon(width: 40, height: 40)
            }
            Spacer()
            VStack(spacing: 27){
                HStack{
                    Image(correct ? "correct_sel" : "correct_nsel")
                        .onTapGesture {
                            withAnimation {
                                correct = true
                            }
                        }
                    Text("勾选即代表同意《知音用户协议》")
                        .font(.system(size: 12))
                        .foregroundColor(Color("FontSecondary"))
                }
                HStack{
                    Spacer()
                    Text("登 录")
                    Spacer()
                }
                .padding(.vertical, 12)
                .background(Color("Primary"),in: RoundedRectangle(cornerRadius: 50))
                .foregroundColor(.white)
                .opacity(correct ? 1 : 0.5)
                .onTapGesture {
                    islogin = SignIn(username: username, password: password)
                }
            }
            .padding(.horizontal, 24)
        }
        .background(Color("Background"))
//        .alert(isPresented: $islogin) {
//            Alert(title: Text("用户名或密码错误"), message: Text(""), primaryButton: Alert.Button.cancel(Text("取消"), action: {
//                islogin = false
//            }), secondaryButton: Alert.Button.default(Text("确定"), action: {
//                islogin = false
//            }))
//        }
    }
}

struct Signin_Previews: PreviewProvider {
    static var previews: some View {
        Signin()
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
