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
    var body: some View {
        HStack{
            HStack{
                Image("store")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(4)
                VStack(alignment: .leading, spacing: 3){
                    Text("Long Time")
                        .font(.system(size: 14))
                        .foregroundColor(Color("OnSurface"))
                    Text("瑾年")
                        .font(.system(size: 12, weight: .thin))
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

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList(profilemoreshow: .constant(false))
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
