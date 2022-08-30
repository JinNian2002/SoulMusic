//
//  ProfileMoreView.swift
//  SoulMusic
//
//  Created by ZZZS on 21.8.22.
//

import SwiftUI

struct ProfileMoreView: View {
    @Binding var profilemoreshow : Bool
    var trashbutton = true
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Text("更多")
                    Spacer()
                }
                    .padding(.top, 12)
                    .padding(.bottom, 24)
                VStack(alignment: .leading, spacing: 30){
                    HStack(spacing: 20){
                        VStack(spacing: 6){
                            HStack{
                                Image("star")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("收藏")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("songlist")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("+歌单")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("album")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("专辑")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("intercut")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("插播")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("prepare")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("待播")
                                .font(.system(size: 14))
                        }
                    }
                    HStack(spacing: 20){
                        VStack(spacing: 6){
                            HStack{
                                Image("share2")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("分享")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("send_dm")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("动态")
                                .font(.system(size: 14))
                        }
//                        VStack(spacing: 6){
//                            HStack{
//                                Image("trash_20_dm")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 24)
//                            }
//                            .circleIcon(width: 40, height: 40)
//                            Text("删除")
//                                .font(.system(size: 14))
//                        }
                    }
                }
                
                HStack{
                    Spacer()
                    Text("取消")
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.bottom, 48)
                .onTapGesture {
                    withAnimation (.easeIn(duration: 0.25)){
                        profilemoreshow = false
                    }
                }
            }
            .background(Color("Surface"),in: RoundedRectangle(cornerRadius: 15))
        }
        .ignoresSafeArea()
    }
}

struct ProfileMoreView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMoreView(profilemoreshow: .constant(false))
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
