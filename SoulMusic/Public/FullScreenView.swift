//
//  FullScreenView.swift
//  SoulMusic
//
//  Created by ZZZS on 21.8.22.
//

import SwiftUI

struct FullScreenView: View {
    @Environment(\.colorScheme) var currentMode
    @Binding var publishshow : Bool
    var fullScreentitle = ""
    var screenbutton = ""
    var body: some View {
        HStack{
            Image(currentMode == .dark ? "x_24_dm" : "x_24")
                .padding(12)
                .onTapGesture {
                    publishshow = false
                }
            Spacer()
            Text(fullScreentitle)
                .font(.system(size: 17, weight: .medium))
            Spacer()
            Text(screenbutton)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
        }
    }
}

struct FullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenView(publishshow: .constant(false))
    }
}
