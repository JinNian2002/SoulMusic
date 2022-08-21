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
    var body: some View {
        ScrollView(.vertical){
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
                    PicCard(shareshow: $shareshow, moreshow: $moreshow, heart: item.heart, username: item.username, time: item.time, image: item.image, text: item.text, pic: item.pic, sharenum: item.sharenum, messagenum: item.messagenum, heartnum: item.heartnum, item: item)
                }
            }
        }
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView(shareshow: .constant(false), moreshow: .constant(false))
            .environmentObject(Model())
    }
}
