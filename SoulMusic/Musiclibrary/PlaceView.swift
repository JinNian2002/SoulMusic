//
//  PlaceView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/31.
//

import SwiftUI

struct PlaceView: View {
    @EnvironmentObject var Weatherdatas : Model
    @State var profilemoreshow = false
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                NavView(isshowfront: false, Navtitle: "听地点")
                HStack{
                    Text("当前地点：上海")
                        .font(.system(size: 14))
                    Spacer()
                    Text("切换地点")
                        .font(.system(size: 12))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .stroke(.white, lineWidth: 1)
                        )
                }
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 6)
                .background(Color("Primary"))
                ScrollView{
                    Image("Shanghai")
                        .resizable()
                        
                        .frame(height: 260)
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            VStack{
                                Spacer()
                                HStack{
                                    Text("上海歌单")
                                    Spacer()
                                    HStack(alignment: .center){
                                        Image("play_dm")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .offset(x: 1.5)
                                    }
                                    .circleIcon(width: 30, height: 30)
                                    .shadow(color: Color("Primary").opacity(0.5), radius: 10, x: 0, y: 0)
                                }
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 10)
                                    .background(LinearGradient(colors: [Color("Surface"), Color("Surface").opacity(0)], startPoint: .bottom, endPoint: .top))
                            }
                        )
                    VStack{
                        ForEach(Weatherdatas.Songsdata) { item in
                            VStack{
                                SongList(profilemoreshow: $profilemoreshow, songname: item.songname, singername: item.myname, image: item.image)
                                Divider()
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                }
            }
            if profilemoreshow{
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation (.easeIn(duration: 0.25)){
                            profilemoreshow = false
                        }
                    }
            }
            ProfileMoreView(profilemoreshow: $profilemoreshow)
                .offset(y: profilemoreshow ? 0 : 323.7)
            .ignoresSafeArea()
        }
        
    }
}
