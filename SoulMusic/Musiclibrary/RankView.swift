//
//  RankView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/30.
//

import SwiftUI

struct RankView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                ForEach(0..<3) { item in
                    NavigationLink{
                        RankDetailView()
                            .navigationBarHidden(true)
                    }label: {
                        VStack(alignment: .leading, spacing: 4){
                            Image("billboard")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 192, height: 96)
                                .clipped()
                                .cornerRadius(6)
                            Text("美国公告牌榜")
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundColor(Color("OnSurface"))
                }
            }
            .padding(.horizontal, 24)
        }
    }
}
