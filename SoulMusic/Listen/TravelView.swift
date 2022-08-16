//
//  TravelView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct TravelView: View {
    @EnvironmentObject var piccarddatas : Model
    var body: some View {
        ScrollView(.vertical){
            VStack{
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

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView()
            .environmentObject(Model())
    }
}
