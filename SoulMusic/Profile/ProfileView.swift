//
//  ProfileView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var currentMode
    @State var profilemoreshow = false
    @State var arshow = false
    @EnvironmentObject var MyClientdata : ClientData
    @EnvironmentObject var Musicdata : Model
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    HStack(spacing: 0){
                        Spacer()
                            NavigationLink{
                                SettingView()
                                    .navigationBarHidden(true)
                            }label: {
                                Image(currentMode == .dark ? "gearshape_48_dm": "gearshape_48")
                            }
                    }
                    HStack{
                        HStack(spacing: 24){
                            Image(uiImage: UIImage(data: MyClientdata.MyClient.clientimage)!)
                                .circleImage(width: 72, height: 72)
                            VStack(alignment: .leading, spacing: 10){
                                Text(MyClientdata.MyClient.username)
                                    .font(.system(size: 18, weight: .black))
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
                        NavigationLink{
                            ProfileDetailView(array2: [MyClientdata.MyClient.username,MyClientdata.MyClient.email, MyClientdata.MyClient.sex,MyClientdata.MyClient.constellation,MyClientdata.MyClient.age,MyClientdata.MyClient.location,MyClientdata.MyClient.job,MyClientdata.MyClient.introduction], clientimage: $MyClientdata.MyClient.clientimage)
                                .navigationBarHidden(true)
                        }label: {
                            HStack(spacing: 0){
                                Text("编辑资料")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("OnSurface"))
                                Image(currentMode == .dark ? "chevron_24_front_dm": "chevron_24_front")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 16)
                            }
                        }
                    }
                    .padding(12)
                    HStack{
                        VStack(spacing: 10){
                            Image(currentMode == .dark ? "star_30_dm": "star_30")
                            Text("收藏")
                                .font(.system(size: 12))
                        }
                        .padding(12)
                        Spacer()
                        VStack(spacing: 10){
                            Image(currentMode == .dark ? "download_30_dm": "download_30")
                            Text("本地")
                                .font(.system(size: 12))
                        }
                        .padding(12)
                        Spacer()
                        VStack(spacing: 10){
                            Image(currentMode == .dark ? "inbox_30_dm": "inbox_30")
                            Text("草稿箱")
                                .font(.system(size: 12))
                        }
                        .padding(12)
                        Spacer()
                        VStack(spacing: 10){
                            Image(currentMode == .dark ? "clock_30_dm": "clock_30")
                            Text("历史记录")
                                .font(.system(size: 12))
                        }
                        .padding(12)
                    }
                    .padding(.horizontal, 24)
                    HStack{
                        Text("我的作品")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(Color("OnSurface"))
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            ForEach(Musicdata.Mysongdatas) { item in
                                SongList(profilemoreshow: $profilemoreshow, songname: item.songname, singername: MyClientdata.MyClient.username, image: item.image)
                                Divider()
                            }
                        }
                        .padding(.leading, 24)
                        .padding(.trailing, 12)
                        Rectangle()
                            .frame(height: 70)
                            .opacity(0)
                    }
                    TabbarView(arshow: $arshow)
                }
                .navigationBarHidden(true)
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
