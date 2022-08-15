//
//  TabbarView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct TabbarView: View {
    enum Selection{
        case listen
        case musiclibrary
        case arcommunity
        case message
        case profile
    }
    @State var select: Selection = .listen
    var body: some View {
        HStack{
            HStack{
                Spacer()
                VStack(spacing: 0){
                    Image(select == .listen ? "icon_listentoworld_24_sel":  "icon_listentoworld_24_nsel")
                    Text("听世界")
                        .font(.system(size: 10))
                        .foregroundColor(select == .listen ? Color("Primary"): Color("Outline"))
                }
                .frame(width: 60)
                .onTapGesture {
                    select = .listen
                }
                Spacer()
                VStack(spacing: 0){
                    Image(select == .musiclibrary ? "icon_musiclibrary_24_sel": "icon_musiclibrary_24_nsel")
                    Text("音乐库")
                        .font(.system(size: 10))
                        .foregroundColor(select == .musiclibrary ? Color("Primary"): Color("Outline"))
                }
                .frame(width: 60)
                .onTapGesture {
                    select = .musiclibrary
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
            HStack{
                Spacer()
                VStack(spacing: 0){
                    Image(select == .message ? "icon_message_24_sel": "icon_message_24_nsel")
                    Text("消息")
                        .font(.system(size: 10))
                        .foregroundColor(select == .message ? Color("Primary"): Color("Outline"))
                }
                .frame(width: 60)
                .onTapGesture {
                    select = .message
                }
                Spacer()
                VStack(spacing: 0){
                    Image(select == .profile ? "icon_profile_24_sel": "icon_profile_24_nsel")
                    Text("我的")
                        .font(.system(size: 10))
                        .foregroundColor(select == .profile ? Color("Primary"): Color("Outline"))
                }
                .frame(width: 60)
                .onTapGesture {
                    select = .profile
                }
                Spacer()
            }
        }
        .padding(.vertical, -8)
        .background(.white)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
