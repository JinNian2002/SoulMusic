//
//  FocusView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct FocusView: View {
    @Environment(\.colorScheme) var currentMode
    @EnvironmentObject var piccarddatas : Model
    @Binding var shareshow: Bool
    @Binding var moreshow : Bool
    @Binding var peopleprofilemoreshow : Bool
    @Binding var isScroll : Bool
    var body: some View {
        ScrollView(.vertical){
            ScorllRead
            VStack{
                HStack{
                    Text("我的关注")
                        .font(.system(size: 17, weight: .medium))
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
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color("OnSurface"))
                    Spacer()
                    HStack(spacing: 5){
                        Image(currentMode == .dark ? "filter_16_dm": "filter_16")
                        Text("排序")
                            .font(.system(size: 12))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                VStack{
                    ForEach(piccarddatas.PicCarddatas) { item in
                        PicCard(shareshow: $shareshow, moreshow: $moreshow, peopleprofilemoreshow: $peopleprofilemoreshow, heart: item.heart, username: item.username, time: item.time, image: item.image, text: item.text, pic: item.pic, sharenum: item.sharenum, messagenum: item.messagenum, heartnum: item.heartnum, item: item)
                    }
                }
            }
        }
    }
    var ScorllRead : some View{
        GeometryReader{ proxy in
            Color.clear
                .preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
//
//            Text("\(proxy.frame(in: .named("scroll")).minY)")
//                .foregroundColor(.white)
        }
        .frame(width: 10, height:0)
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            if value < 0{
                withAnimation {
                    isScroll = false
                }
            }else if value > 0{
                withAnimation {
                    isScroll = true
                }
            }
        }
    }
}



struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView(shareshow: .constant(false), moreshow: .constant(false), peopleprofilemoreshow: .constant(false), isScroll: .constant(false))
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
