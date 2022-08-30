//
//  SongList.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct SongList: View {
    @Environment(\.colorScheme) var currentMode
    @Binding var profilemoreshow : Bool
    var songname : String
    var singername : String
    var image : String
    var body: some View {
        HStack{
            HStack(spacing: 10){
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(4)
                VStack(alignment: .leading, spacing: 3){
                    Text(songname)
                        .font(.system(size: 14))
                        .foregroundColor(Color("OnSurface"))
                    Text(singername)
                        .font(.system(size: 12))
                        .foregroundColor(Color("FontSecondary"))
                }
            }
            Spacer()
            Image(currentMode == .dark ? "more_dm" : "more")
                .padding(12)
                .onTapGesture {
                    withAnimation (.easeOut(duration: 0.25)){
                        profilemoreshow = true
                    }
                    
                }
        }
    }
}
