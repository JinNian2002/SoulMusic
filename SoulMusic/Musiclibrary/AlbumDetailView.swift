//
//  AlbumView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/31.
//

import SwiftUI

struct AlbumDetailView: View {
    @EnvironmentObject var Albumsongsdatas : Model
    @Environment(\.colorScheme) var currentMode
    @State var profilemoreshow = false
    @State var shareshow = false
    @State var heart = false
    @State var star = false
    var body: some View {
        ZStack{
            VStack{
                NavView(isshowfront: false, Navtitle: "")
                HStack(spacing: 12){
                    Image("blonde")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Blonde")
                            HStack{
                                Image("frankocean")
                                    .circleImage(width: 24, height: 24)
                                Text("Frank Ocean")
                                    .font(.system(size: 14))
                            }
                        }
                        Spacer()
                        HStack{
                            Text("极致细腻的情感表达，Frank...")
                                .font(.system(size: 12))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(Color("FontSecondary"))
                    }
                }
                .frame(height: 100)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                
                HStack{
                    HStack(spacing: 6){
                        Image(currentMode == .dark ? "share_20_dm" : "share_20")
                        Text("234")
                            .font(.system(size: 12))
                    }
                    .onTapGesture {
                        withAnimation (.easeOut(duration: 0.25)){
                            shareshow = true
                        }
                    }
                    Spacer()
                    HStack(spacing: 6){
                        Image(heart ? "heart_20_sel": currentMode == .dark ? "heart_20_nsel_dm" :"heart_20_nsel")
                        if heart{
                            Text("\(65 + 1)")
                                .font(.system(size: 12))
                        }else{
                            Text("\(65)")
                                .font(.system(size: 12))
                        }
                    }
                    .onTapGesture {
                            heart.toggle()
                    }
                    Spacer()
                    HStack(spacing: 6){
                        Image(star ? "star_20_sel" : currentMode == .dark ? "star_30_dm" : "star_30")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        if star{
                            Text("\(288 + 1)")
                                .font(.system(size: 12))
                        }else{
                            Text("\(288)")
                                .font(.system(size: 12))
                        }
                    }
                    .onTapGesture {
                            star.toggle()
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 24)
                HStack{
                    Text("专辑曲目")
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
                ScrollView{
                    VStack{
                        ForEach(Albumsongsdatas.Albumsongsdata) { item in
                            VStack{
                                HStack{
                                    if item.id < 9{
                                        Text("0\(item.id + 1)")
                                            .frame(width: 21)
                                    }else{
                                        Text("\(item.id + 1)")
                                            .frame(width: 21)
                                    }
                                    Spacer()
                                    SongList(profilemoreshow: $profilemoreshow, songname: item.songname, singername: item.myname, image: item.image)
                                }
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
            if shareshow{
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation (.easeIn(duration: 0.25)){
                            shareshow = false
                        }
                    }
            }
            ShareView(shareshow: $shareshow)
                .offset(y: shareshow ? 0 : 323.7)
            .ignoresSafeArea()
        }
       
    }
}
