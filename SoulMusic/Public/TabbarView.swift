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
    @State var isplayershow = false
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
                    Button{
                        
                    }label: {
                        Image(currentMode == .dark ? "skip_back_dm" : "skip_back")
                    }
                    
                    Button{
                        withAnimation {
                            ispause.toggle()
                        }
                    }label: {
                        Image(ispause ? (currentMode == .dark ? "pause_dm" : "pause") : (currentMode == .dark ? "play_dm" : "play"))
                    }
                    Button{
                        
                    }label: {
                        Image(currentMode == .dark ? "skip_forward_dm" : "skip_forward")
                    }
                    
                }
                
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(.thinMaterial)
            .offset(y: -60)
            .onTapGesture {
                isplayershow = true
            }
            .sheet(isPresented: $isplayershow) {
                VStack{
                    VStack(spacing: 24){
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 50, height: 5)
                            .foregroundColor(Color("FontSecondary").opacity(0.75))
                        VStack{
                            Image("store")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                                .cornerRadius(6)
                            Spacer()
                            VStack(spacing: 9){
                                Text("Supercut").font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                                Text("Lorde")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("FontSecondary"))
                            }
                            Spacer()
                            HStack(spacing: 34){
                                Button{
                                    
                                }label: {
                                    Image("skip_back")
                                }
                                Button{
                                    withAnimation {
                                        ispause.toggle()
                                    }
                                }label: {
                                    HStack{
                                        if ispause{
                                            Image("pause_dm")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30, height: 30)
                                        }else{
                                            Image("play_dm")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30, height: 30)
                                                .offset(x: 3)
                                        }
                                        
                                    }
                                    .circleIcon(width: 60, height: 60)
                                    .shadow(color: Color("Primary").opacity(0.5), radius: 10, x: 0, y: 0)
                                }
                                Button{
                                    
                                }label: {
                                    Image("skip_forward")
                                }
                            }
                            Spacer()
                            VStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(height: 2)
                                    .foregroundColor(Color("FontSecondary").opacity(0.5))
                                    .overlay(
                                        HStack{
                                            RoundedRectangle(cornerRadius: 50)
                                                .frame(width: 50, height: 2)//进度条
                                                .foregroundColor(Color("Primary"))
                                                .overlay(
                                                    HStack{
                                                        Spacer()
                                                        Circle()
                                                            .frame(width: 6, height: 6)
                                                            .foregroundColor(Color("Primary"))
                                                    }
                                                )
                                            Spacer()
                                        }
                                    )
                                HStack{
                                    Text("1:15")
                                    Spacer()
                                    Text("-2:15")
                                }
                                .foregroundColor(Color("FontSecondary").opacity(0.5))
                                .font(.system(size: 12))
                            }
                            Spacer()
                            HStack{
                                Image("player_list")
                                Spacer()
                                Image("player_airplay")
                                Spacer()
                                Image("player_adjust")
                                Spacer()
                                Image("player_lyric")
                                Spacer()
                                Image("player_more")
                            }
                        }
                    }
                    .padding(24)
                    .background(.ultraThinMaterial)
                }
                .background(Image("playerbackground").resizable().aspectRatio(contentMode: .fill))
            }
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
