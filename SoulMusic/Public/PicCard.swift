//
//  PicCard.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct PicCard: View {
    @Binding var shareshow : Bool
    @Binding var moreshow : Bool
    @Binding var peopleprofilemoreshow : Bool
    @State var arshow = false
    var heart = false
    var username = ""
    var time = ""
    var image = ""
    var text = ""
    var pic = ""
    var sharenum = 0
    var messagenum = 0
    var heartnum = 0
    var item : PicCarddata
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            CardName(moreshow: $moreshow, peopleprofilemoreshow: $peopleprofilemoreshow, username: username, time: time, image: image)
            if item.type == "pic" {
                Text(text)
                    .font(.system(size: 16))
                    .foregroundColor(Color("OnSurface"))
            
                
                Image(pic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.height / 4)
                    .clipped()
                    .cornerRadius(6)
            }else if item.type == "text"{
                Text(text)
                    .font(.system(size: 16))
                    .foregroundColor(Color("OnSurface"))
            }else if item.type == "ar"{
                Text(text)
                    .font(.system(size: 16))
                    .foregroundColor(Color("OnSurface"))
                Image(pic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.height / 4)
                    .clipped()
                    .cornerRadius(6)
                    .overlay(
                        VStack(alignment: .leading){
                            Spacer()
                            HStack{
                                HStack(spacing: 3){
                                    Image("ar_dm")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 16, height: 16)
                                    Text("AR社区")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical, 4)
                                .padding(.horizontal, 6)
                                .background(.white.opacity(0.7), in: RoundedRectangle(cornerRadius: 50))
                                Spacer()
                            }
                            
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 6)
                    )
                    .onTapGesture {
                        arshow = true
                    }
                    .fullScreenCover(isPresented: $arshow) {
                        RealityComposerView(arshow: $arshow)
                    }
            }
                
            CardBar(heart: heart, shareshow: $shareshow, sharenum: sharenum, messagenum: messagenum, heartnum: heartnum)
            
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(Color("Surface"))
    }
}
