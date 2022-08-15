//
//  CardBar.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct CardBar: View {
    @EnvironmentObject var piccarddatas : Model
    @State var heart = false
    var sharenum = 0
    var messagenum = 0
    var heartnum = 0
    var body: some View {
        HStack{
            HStack(spacing: 6){
                Image("share_20")
                Text("\(sharenum)")
                    .font(.system(size: 12))
            }
            Spacer()
            HStack(spacing: 6){
                Image("message_20")
                Text("\(messagenum)")
                    .font(.system(size: 12))
            }
            Spacer()
            HStack(spacing: 6){
                Image(heart ? "heart_20_sel": "heart_20_nsel")
                Text("\(heartnum)")
                    .font(.system(size: 12))
            }
            .onTapGesture {
                    heart.toggle()
                
            }
        }
    }
}
