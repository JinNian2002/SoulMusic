//
//  CardBar.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct CardBar: View {
    @Environment(\.colorScheme) var currentMode
    @EnvironmentObject var remarkdatas : Model
    @State var heart = false
    @State var sheetshow = false
    var sharenum = 0
    var messagenum = 0
    var heartnum = 0
    var body: some View {
        HStack{
            HStack(spacing: 6){
                Image(currentMode == .dark ? "share_20_dm" : "share_20")
                Text("\(sharenum)")
                    .font(.system(size: 12))
            }
            Spacer()
            HStack(spacing: 6){
                Image(currentMode == .dark ? "message_20_dm" :"message_20")
                Text("\(messagenum)")
                    .font(.system(size: 12))
            }
            .onTapGesture {
                sheetshow = true
            }
            //评论页面
            .sheet(isPresented: $sheetshow) {
                VStack{
                    HStack{
                        Image("x_24")
                            .padding(12)
                            .hidden()
                        Spacer()
                        Text("评论")
                        Spacer()
                        Image(currentMode == .dark ? "x_24_dm" : "x_24")
                            .padding(12)
                            .onTapGesture {
                                sheetshow = false
                            }
                    }
                    ScrollView{
                        VStack{
                            ForEach(remarkdatas.Remarkdatas) { item in
                                RemarkCard(image: item.image, username: item.username, time: item.time, text: item.text)
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                }
            }
            Spacer()
            HStack(spacing: 6){
                Image(heart ? "heart_20_sel": currentMode == .dark ? "heart_20_nsel_dm" :"heart_20_nsel")
                Text("\(heartnum)")
                    .font(.system(size: 12))
            }
            .onTapGesture {
                    heart.toggle()
                
            }
        }
        .padding(.vertical, 4)
    }
}
