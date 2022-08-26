//
//  RemarkCard.swift
//  SoulMusic
//
//  Created by ZZZS on 18.8.22.
//

import SwiftUI

struct RemarkCard: View {
    @EnvironmentObject var remarkdatas : Model
    var image = ""
    var username = ""
    var time = ""
    var text = ""
    var body: some View {
        VStack{
            HStack(spacing: 8){
                Image(image)
                    .circleImage(width: 46, height: 46)
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text(username)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color("OnSurface"))
                        Spacer()
                        Text(time)
                            .font(.system(size: 12))
                            .foregroundColor(Color("FontSecondary"))
                    }
                    Text(text)
                        .font(.system(size: 14))
                        .foregroundColor(Color("OnSurface"))
                }
            }
            .padding(.vertical, 6)
            Divider()
        }
    }
}

struct RemarkCard_Previews: PreviewProvider {
    static var previews: some View {
        RemarkCard()
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
