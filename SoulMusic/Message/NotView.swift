//
//  NotView.swift
//  SoulMusic
//
//  Created by ZZZS on 21.8.22.
//

import SwiftUI

struct NotView: View {
    @Environment(\.colorScheme) var currentMode
    @State var placeholdertext: String = ""
    @State var ontap : Bool = false
    @State var issearch : Bool = false
    @State var isselect : Int = 0
    @EnvironmentObject var notdatas : Model
    var tagwidth : CGFloat = 66
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                VStack{
                    HStack{
                        Image("search")
                        TextField("搜索消息...", text: $placeholdertext)
                            .font(.system(size: 13.5, weight: .light))
                            .onTapGesture {
                                withAnimation (.easeIn(duration: 0.1)){
                                    issearch = true
                                }
                            }
                        }
                    .padding(.vertical ,4)
                    .padding(.horizontal, 13)
                    .background(Color("Input"), in: RoundedRectangle(cornerRadius: 50))
                }
                .padding(.horizontal, 12)
                HStack(spacing: 0){
                    Text("消息")
                        .font(isselect == 0 ? .system(size: 17, weight: .black):  .system(size: 17, weight: .regular))
                        .padding(.vertical, 12)
                        .frame(width: tagwidth)
                        .foregroundColor(Color("OnSurface"))
                
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                        isselect = 0
                    }
                }
                    Text("动态")
                        .font(isselect == 1 ? .system(size: 17, weight: .black):  .system(size: 17, weight: .regular))
                        .padding(.vertical, 12)
                        .frame(width: tagwidth)
                        .foregroundColor(Color("OnSurface"))
                
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                        isselect = 1
                        }
                    }
                }
                .padding(.horizontal, 12)
                .overlay(
                    HStack{
                        VStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(Color("Primary"))
                                .frame(width: tagwidth, height: 2)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 12)
                    .offset(x: CGFloat(isselect) * (tagwidth))
                )
                TabView(selection: $isselect) {
                    ScrollView{
                        VStack{
                            HStack{
                                VStack(spacing: 10){
                                    Image(currentMode == .dark ? "list_dm": "list")
                                    Text("系统通知")
                                        .font(.system(size: 14))
                                }
                                .frame(width: 74)
                                Spacer()
                                VStack(spacing: 10){
                                    Image(currentMode == .dark ? "heart_20_nsel_dm": "heart_20_nsel")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    Text("收到的喜欢")
                                        .font(.system(size: 14))
                                }
                                .frame(width: 74)
                                Spacer()
                                VStack(spacing: 10){
                                    Image(currentMode == .dark ? "atsign_dm": "atsign")
                                    Text("@我")
                                        .font(.system(size: 14))
                                }
                                .frame(width: 74)
                                Spacer()
                                VStack(spacing: 10){
                                    Image(currentMode == .dark ? "message_20_dm": "message_20")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    Text("回复我的")
                                        .font(.system(size: 14))
                                }
                                .frame(width: 74)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 15)
                            VStack(spacing: 0){
                                ForEach(notdatas.Notdatas) { item in
                                    NotCard(image: item.image, username: item.username, time: item.time, text: item.text)
                                }
                                
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                    .tag(0)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                TabbarView()
            }
            .navigationBarHidden(true)
        }
    }
}

struct NotView_Previews: PreviewProvider {
    static var previews: some View {
        NotView()
            .environmentObject(Model())
    }
}
