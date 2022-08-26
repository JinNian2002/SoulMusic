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
    var tagwidth : CGFloat = 66
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0){
                ForEach(tabdatas.Tabdatas) { item in
                    
                        Text(item.tabtext)
                            .font(isselect == item.id ? .system(size: 17, weight: .black):  .system(size: 17, weight: .regular))
                            .padding(.vertical, 12)
                            .frame(width: tagwidth)
                            .foregroundColor(Color("OnSurface"))
                    
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
                .offset(x: CGFloat(isselect) * (tagwidth))
            )
        }
    }
}

struct TabtitleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
