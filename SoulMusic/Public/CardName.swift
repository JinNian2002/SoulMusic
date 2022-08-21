//
//  CardName.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct CardName: View {
    @Environment(\.colorScheme) var currentMode
    @Binding var moreshow : Bool
    var username = ""
    var time = ""
    var image = ""
    var body: some View {
        HStack{
            Image(image)
                .circleImage(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 4){
                Text(username)
                    .font(.system(size: 14))
                    .foregroundColor(Color("OnSurface"))
                Text("\(time)")
                    .font(.system(size: 12))
                    .foregroundColor(Color("FontSecondary"))
            }
            Spacer()
            Image(currentMode == .dark ? "more_dm" : "more")
                .onTapGesture {
                    withAnimation (.easeOut(duration: 0.25)){
                        moreshow = true
                    }
                }
        }
    }
}

struct CardName_Previews: PreviewProvider {
    static var previews: some View {
        CardName(moreshow: .constant(false))
    }
}
