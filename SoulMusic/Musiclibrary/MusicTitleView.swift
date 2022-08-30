//
//  MusicTitleView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/30.
//

import SwiftUI

struct MusicTitleView: View {
    @Environment(\.colorScheme) var currentMode
    var title : String
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color("OnSurface"))
            Spacer()
            HStack(spacing: 0){
                Text("更多")
                    .font(.system(size: 14))
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
            }
            .foregroundColor(Color("FontSecondary"))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 5)
    }
}
