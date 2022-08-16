//
//  FocusView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct FocusView: View {
    @EnvironmentObject var piccarddatas : Model
    var body: some View {
        ScrollView(.vertical){
            VStack{
                HStack{
                    Text("我的关注")
                        .font(.system(size: 17))
                        .foregroundColor(Color("OnSurface"))
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 9)
                .padding(.top, 21)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 17){
                        ForEach(piccarddatas.PicCarddatas) { item in
                            VStack{
                                Image(item.image)
                                    .circleImage(width: 50, height: 50)
                                    .padding(2)
                                    .background(Color("Primary"), in: RoundedRectangle(cornerRadius: 100))
                                Text(item.username)
                                    .font(.system(size: 10))
                            }
                        }
                        
                    }
                    .padding(.horizontal, 24)
                }
                HStack{
                    Text("最新动态")
                        .font(.system(size: 17))
                        .foregroundColor(Color("OnSurface"))
                    Spacer()
                    HStack(spacing: 5){
                        Image("filter_16")
                        Text("排序")
                            .font(.system(size: 12, weight: .thin))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                VStack{
                    ForEach(piccarddatas.PicCarddatas) { item in
                        PicCard(heart: item.heart, username: item.username, time: item.time, image: item.image, text: item.text, pic: item.pic, sharenum: item.sharenum, messagenum: item.messagenum, heartnum: item.heartnum)
                    }
                }
            }
        }
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView()
            .environmentObject(Model())
    }
}
