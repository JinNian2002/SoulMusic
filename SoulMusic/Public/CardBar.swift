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
    @State var placeholdertext = ""
    @Binding var shareshow : Bool
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
            .onTapGesture {
                withAnimation (.easeOut(duration: 0.25)){
                    shareshow = true
                }
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
                VStack(spacing: 0){
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
                    Divider()
                    HStack{
                        Image(systemName: "square.and.pencil").opacity(0.25)
                        TextField("发表你的评论...", text: $placeholdertext)
                            .font(.system(size: 13.5, weight: .light))
                        
                        Image(systemName: "at").opacity(0.25)
                    }
                    .padding(12)
                }
            }
            Spacer()
            HStack(spacing: 6){
                Image(heart ? "heart_20_sel": currentMode == .dark ? "heart_20_nsel_dm" :"heart_20_nsel")
                if heart{
                    Text("\(heartnum + 1)")
                        .font(.system(size: 12))
                }else{
                    Text("\(heartnum)")
                        .font(.system(size: 12))
                }
            }
            .onTapGesture {
                    heart.toggle()
                
            }
        }
        .padding(.vertical, 4)
    }
}
