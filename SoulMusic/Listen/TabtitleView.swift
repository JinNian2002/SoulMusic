//
//  TabtitleView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct TabtitleView: View {
    @Namespace var namespace
    @Binding var isselect : Int
    @EnvironmentObject var tabdatas : Model
    var tagwidth : CGFloat = 58
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8){
                ForEach(tabdatas.Tabdatas) { item in
                    VStack(spacing: 4){
                        Text(item.tabtext)
                            .font(isselect == item.id ? .system(size: 17, weight: .medium):  .system(size: 17, weight: .regular))
                            .padding(.vertical, 8)
                            .frame(width: tagwidth)
                            .foregroundColor(Color("OnSurface"))
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                            isselect = item.id
                        }
                    }
                }
            }
            .padding(.horizontal, 12)
            //Tabtag动画
            .overlay(
                HStack{
                    VStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color("Primary"))
                            .frame(width: tagwidth, height: 2)
                    }
                    Spacer()
                }
                .padding(.horizontal, 12)
                .offset(x: CGFloat(isselect) * (tagwidth + 8))
            )
        }
    }
}

struct TabtitleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}
