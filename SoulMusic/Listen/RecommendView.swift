//
//  RecommendView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct RecommendView: View {
    @EnvironmentObject var piccarddatas : Model
    @Binding var shareshow : Bool
    @Binding var moreshow : Bool
    @Binding var peopleprofilemoreshow : Bool
    @Binding var isScroll : Bool
    var body: some View {
        ScrollView(.vertical){
            ScorllRead
            FunctionView()
            HStack{
                Text("动态推荐")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color("OnSurface"))
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 5)
            VStack{
                ForEach(piccarddatas.PicCarddatas) { item in
                    PicCard(shareshow: $shareshow, moreshow: $moreshow, peopleprofilemoreshow: $peopleprofilemoreshow, heart: item.heart, username: item.username, time: item.time, image: item.image, text: item.text, pic: item.pic, sharenum: item.sharenum, messagenum: item.messagenum, heartnum: item.heartnum, item: item)
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

struct ScrollPreferenceKey : PreferenceKey{
    static var defaultValue : CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView(shareshow: .constant(false), moreshow: .constant(false), peopleprofilemoreshow: .constant(false), isScroll: .constant(false))
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
