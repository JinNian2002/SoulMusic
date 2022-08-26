//
//  TravelView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct TravelView: View {
    @EnvironmentObject var piccarddatas : Model
    @Environment(\.colorScheme) var currentMode
    @Binding var shareshow : Bool
    @Binding var moreshow : Bool
    @Binding var peopleprofilemoreshow : Bool
    var body: some View {
        ScrollView(.vertical){
            VStack{
                HStack{
                    Text("最新动态")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color("OnSurface"))
                    Spacer()
                    HStack(spacing: 5){
                        Image(currentMode == .dark ? "filter_16_dm": "filter_16")
                        Text("排序")
                            .font(.system(size: 12, weight: .thin))
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
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView(shareshow: .constant(false), moreshow: .constant(false), peopleprofilemoreshow: .constant(false))
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
