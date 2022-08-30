//
//  MusiclibraryView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/30.
//

import SwiftUI

struct MusiclibraryView: View {
    @State var placeholdertext = ""
    @State var refreshable = false
    @State var circleimages = 0
    @State var arshow = false
    @State var profilemoreshow = false
    @EnvironmentObject var Musicdatas : Model
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    HStack{
                        HStack{
                            Image("search")
                            TextField("搜索用户、动态、音乐...", text: $placeholdertext)
                                .font(.system(size: 13.5, weight: .light))
                            if placeholdertext != "" {
                                Button{
                                    placeholdertext = ""
                                }label: {
                                    Image(systemName: "xmark.circle.fill")
                                }
                                .foregroundColor(.black.opacity(0.4))
                            }
                        }
                        .padding(.vertical ,4)
                        .padding(.horizontal, 13)
                        .background(Color("Input"), in: RoundedRectangle(cornerRadius: 50))
                    }
                    .padding(.horizontal, 12)
                    RefreshableScrollView(height: 70, refreshing: $refreshable) {
                        TabView(selection: $circleimages) {
                            ForEach(Musicdatas.Circledatas) { item in
                                NavigationLink{
                                    AlbumDetailView()
                                        .navigationBarHidden(true)
                                }label: {
                                    VStack{
                                        Spacer()
                                        VStack(spacing: 4){
                                            HStack{
                                                Text(item.title)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                                Spacer()
                                            }
                                            HStack{
                                                Text(item.text)
                                                    .foregroundColor(.white.opacity(0.8))
                                                    .font(.system(size: 12))
                                                    .frame(width: UIScreen.main.bounds.width / 3 * 2, alignment: .leading)
                                                Spacer()
                                            }
                                        }
                                        .padding(.horizontal,12)
                                        .padding(.bottom, 24)
                                        .padding(.top, 12)
                                        .background(.ultraThinMaterial)
                                    }
                                }
                                .background(Image(item.image).resizable().aspectRatio(contentMode: .fill))
                                .cornerRadius(6)
                                .padding(.horizontal, 24)
                                .tag(item.id)
                            }
                        }
                        .padding(.vertical, 12)
                        .frame(height: 258)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .overlay(
                            VStack{
                                Spacer()
                                HStack(spacing: 6){
                                    ForEach(0..<Musicdatas.Circledatas.count) { item in
                                        if item != circleimages{
                                            Circle()
                                                .foregroundColor(Color("FontSecondary").opacity(0.5))
                                                .frame(width: 5, height: 5)
                                        }else{
                                            Circle()
                                                .foregroundColor(Color("Primary"))
                                                .frame(width: 6, height: 6)
                                        }
                                    }
                                }
                            }.padding(.vertical, 22)
                        )
                        Group{
                            MusicTitleView(title: "最新专辑")
                            AlbumListView()
                            MusicTitleView(title: "最新歌曲")
                            NewSongsListView(profilemoreshow: $profilemoreshow)
                            MusicTitleView(title: "最新歌单")
                            SongListView()
                            MusicTitleView(title: "排行榜")
                            RankView()
                        }
                        //占位，将页面顶出播放器区域
                        Rectangle()
                            .frame(height: 70)
                            .opacity(0)
                        if refreshable{
                        //加载效果
                        Rectangle()
                            .frame(height: 1)
                            .opacity(0)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                                    withAnimation {
                                        refreshable = false
                                    }
                                })
                            }
                        }
                    }
                    TabbarView(arshow: $arshow)
                }
                .background(Color("Surface"))
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
            .navigationBarHidden(true)
        }
    }
}

struct MusiclibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MusiclibraryView()
            .environmentObject(Model())
    }
}
