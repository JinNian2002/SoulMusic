//
//  ShareView.swift
//  SoulMusic
//
//  Created by ZZZS on 21.8.22.
//

import SwiftUI

struct ShareView: View {
    @Binding var shareshow : Bool
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Text("分享至")
                    Spacer()
                }
                
                    .padding(.top, 12)
                    .padding(.bottom, 24)
                VStack(alignment: .leading, spacing: 30){
                    HStack(spacing: 20){
                        VStack(spacing: 6){
                            HStack{
                                Image("qq")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("QQ")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("wechat")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("微信")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("twitch")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("Twitch")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("youtube")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("Youtube")
                                .font(.system(size: 14))
                        }
                        VStack(spacing: 6){
                            HStack{
                                Image("twitter")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("Twitter")
                                .font(.system(size: 14))
                        }
                    }
                    HStack(spacing: 20){
                        VStack(spacing: 6){
                            HStack{
                                Image("icon_arcommunity_24_white")
                            }
                            .circleIcon(width: 40, height: 40)
                            Text("社区")
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
                        shareshow = false
                    }
                }
            }
            .background(Color("Surface"),in: RoundedRectangle(cornerRadius: 15))
        }
        .ignoresSafeArea()
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView(shareshow: .constant(false))
    }
}
