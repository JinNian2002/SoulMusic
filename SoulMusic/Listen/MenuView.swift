//
//  MenuView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct MenuView: View {
    @Binding var ontap : Bool
    var body: some View {
        VStack(alignment: .leading){
            Label("发布动态", image: "send")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            Label("发布音乐", image: "upload")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            Label("AR社区文件制作", image: "filetext")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            Label("便携记录", image: "edit")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
        }
        .padding(.vertical, 4)
        .frame(width: UIScreen.main.bounds.width / 2 - 12, alignment: .leading)
        .foregroundColor(Color("OnSurface"))
        .background(.white, in: RoundedRectangle(cornerRadius: 6))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
