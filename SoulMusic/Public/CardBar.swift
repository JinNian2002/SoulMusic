//
//  CardBar.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct CardBar: View {
    @Environment(\.colorScheme) var currentMode
    @EnvironmentObject var piccarddatas : Model
    @State var heart = false
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
