//
//  ProfileView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack(spacing: 0){
                    Spacer()
                    Image("moon_48")
                        NavigationLink{
                            SettingView()
                                .navigationBarHidden(true)
                        }label: {
                            Image("gearshape_48")
                        }
                }
                HStack{
                    HStack(spacing: 24){
                        Image("profilepic4")
                            .circleImage(width: 72, height: 72)
                        VStack(alignment: .leading, spacing: 10){
                            Text("瑾年")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(Color("OnSurface"))
                            HStack(spacing: 7){
                                HStack(spacing: 6){
                                    Text("关注")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("OnSurface"))
                                    Text("123")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("FontSecondary"))
                                }
                                HStack(spacing: 6){
                                    Text("粉丝")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("OnSurface"))
                                    Text("12")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("FontSecondary"))
                                }
                                HStack(spacing: 6){
                                    Text("动态")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("OnSurface"))
                                    Text("93")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("FontSecondary"))
                                }
                            }
                        }
                    }
                    Spacer()
                    HStack(spacing: 0){
                        Text("个人空间")
                            .font(.system(size: 14, weight: .thin))
                            .foregroundColor(Color("OnSurface"))
                        Image("chevron_16")
                    }
                }
                .padding(12)
                HStack{
                    VStack(spacing: 10){
                        Image("star_30")
                        Text("收藏")
                            .font(.system(size: 12))
                    }
                    .padding(12)
                    Spacer()
                    VStack(spacing: 10){
                        Image("download_30")
                        Text("本地")
                            .font(.system(size: 12))
                    }
                    .padding(12)
                    Spacer()
                    VStack(spacing: 10){
                        Image("inbox_30")
                        Text("草稿箱")
                            .font(.system(size: 12))
                    }
                    .padding(12)
                    Spacer()
                    VStack(spacing: 10){
                        Image("clock_30")
                        Text("历史记录")
                            .font(.system(size: 12))
                    }
                    .padding(12)
                }
                .padding(.horizontal, 24)
                HStack{
                    Text("我的作品")
                        .font(.system(size: 17))
                        .foregroundColor(Color("OnSurface"))
                    Spacer()
                }
                .padding(.horizontal, 24)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ForEach(0..<10) { item in
                            SongList()
                            Divider()
                        }
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 12)
                }
                TabbarView()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(Model())
    }
}
