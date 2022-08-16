//
//  NavView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct NavView: View {
    @Environment(\.dismiss) var dismiss
    var isshowfront = false
    var Navtitle = ""
    var body: some View {
        HStack{
            Image("chevron_24_back")
                .padding(12)
                .onTapGesture {
                    dismiss()
                }
            Spacer()
            Text(Navtitle)
                .font(.system(size: 17, weight: .medium))
            Spacer()
            Image("chevron_24_front")
                .padding(12)
                .opacity(isshowfront ? 1: 0)
        }
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
