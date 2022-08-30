//
//  TabbarView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct TabbarView: View {
    @Environment(\.colorScheme) var currentMode
    @EnvironmentObject var model: Model
    @Namespace var namespace
    @Binding var arshow : Bool
    @State var ispause = false
    var body: some View {
        ZStack{
            HStack{
                HStack{
                    Image("store")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(4)
                    Text("Supercut")
                }
                Spacer()
                HStack(spacing: 27){
                    Image(currentMode == .dark ? "skip_back_dm" : "skip_back")
                    Button{
                        withAnimation {
                            ispause.toggle()
                        }
                    }label: {
                        Image(ispause ? (currentMode == .dark ? "pause_dm" : "pause") : (currentMode == .dark ? "play_dm" : "play"))
                    }
                    Image(currentMode == .dark ? "skip_forward_dm" : "skip_forward")
                }
                
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(.thinMaterial)
            .offset(y: -60)
            VStack{
                HStack{
                    HStack{
                        Spacer()
                        VStack(spacing: 0){
                            Image(model.select == .listen ? "icon_listentoworld_24_sel":  "icon_listentoworld_24_nsel")
                            Text("听世界")
                                .font(.system(size: 10))
                                .foregroundColor(model.select == .listen ? Color("Primary"): Color("Outline"))
                        }
                        .frame(width: 60)
                        .onTapGesture {
                            model.select = .listen
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Image(model.select == .musiclibrary ? "icon_musiclibrary_24_sel": "icon_musiclibrary_24_nsel")
                            Text("音乐库")
                                .font(.system(size: 10))
                                .foregroundColor(model.select == .musiclibrary ? Color("Primary"): Color("Outline"))
                        }
                        .frame(width: 60)
                        .onTapGesture {
                            model.select = .musiclibrary
                        }
                        Spacer()
                    }
                    VStack(spacing: 0){
                        Image("icon_arcommunity_24_white")
                        Text("AR社区")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                    .frame(width: 60, height: 60, alignment: .center)
                    .background(LinearGradient(colors: [Color("Linzear_start"), Color("Linzear_end")], startPoint: .leading, endPoint: .trailing))
                    .mask(Circle())
                    .shadow(color: Color("Primary").opacity(0.75), radius: 8, x: 0, y: 0)
                    .offset(y: -12)
                    .onTapGesture {
                        arshow = true
                    }
                    .fullScreenCover(isPresented: $arshow) {
    //                    ARcommunityView(arshow: $arshow)
                        RealityComposerView(arshow: $arshow)
                    }
                    HStack{
                        Spacer()
                        VStack(spacing: 0){
                            Image(model.select == .message ? "icon_message_24_sel": "icon_message_24_nsel")
                            Text("消息")
                                .font(.system(size: 10))
                                .foregroundColor(model.select == .message ? Color("Primary"): Color("Outline"))
                        }
                        .frame(width: 60)
                        .onTapGesture {
                            model.select = .message
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Image(model.select == .profile ? "icon_profile_24_sel": "icon_profile_24_nsel")
                            Text("我的")
                                .font(.system(size: 10))
                                .foregroundColor(model.select == .profile ? Color("Primary"): Color("Outline"))
                        }
                        .frame(width: 60)
                        .onTapGesture {
                            model.select = .profile
                        }
                        Spacer()
                    }
                }
                .padding(.vertical, -8)
            }
            .shadow(color: .black.opacity(0.05), radius: 46, x: -4)
        }
        .background(Color("Surface"))
        .ignoresSafeArea(.all)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(arshow: .constant(false))
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
