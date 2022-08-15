//
//  PicCard.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct PicCard: View {
    var heart = false
    var username = ""
    var time = ""
    var image = ""
    var text = ""
    var pic = ""
    var sharenum = 0
    var messagenum = 0
    var heartnum = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 7){
            CardName(username: username, time: time, image: image)
            
                Text(text)
                    .font(.system(size: 16, weight: .thin))
                    .foregroundColor(Color("OnSurface"))
            
                
            Image(pic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height / 4)
                .clipped()
                .cornerRadius(6)
            CardBar(heart: heart, sharenum: sharenum, messagenum: messagenum, heartnum: heartnum)
            
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(.white)
    }
}
