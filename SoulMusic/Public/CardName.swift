//
//  CardName.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct CardName: View {
    var username = ""
    var time = ""
    var image = ""
    var body: some View {
        HStack{
            Image(image)
                .circleImage(width: 40, height: 40)
            VStack(alignment: .leading){
                Text(username)
                    .font(.system(size: 14))
                    .foregroundColor(Color("OnSurface"))
                Text("\(time)发表了该动态")
                    .font(.system(size: 12, weight: .thin))
                    .foregroundColor(Color("FontSecondary"))
            }
            Spacer()
            Image("more")
        }
    }
}

struct CardName_Previews: PreviewProvider {
    static var previews: some View {
        CardName()
    }
}
