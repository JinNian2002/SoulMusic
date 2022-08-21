//
//  NotCard.swift
//  SoulMusic
//
//  Created by ZZZS on 22.8.22.
//

import SwiftUI

struct NotCard: View {
    var image = ""
    var username = ""
    var time = ""
    var text = ""
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 8){
                Image(image)
                    .circleImage(width: 46, height: 46)
                VStack(alignment: .leading, spacing: 6){
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
                        .font(.system(size: 12))
                        .foregroundColor(Color("OnSurface"))
                }
            }
            .padding(.vertical, 12)
            Divider()
        }
    }
}

struct NotCard_Previews: PreviewProvider {
    static var previews: some View {
        NotCard()
    }
}
