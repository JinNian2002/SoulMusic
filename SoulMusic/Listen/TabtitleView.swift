//
//  TabtitleView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct TabtitleView: View {
    @Binding var isselect : Int
    @EnvironmentObject var tabdatas : Model
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8){
                ForEach(tabdatas.Tabdatas) { item in
                    VStack(spacing: 4){
                        Text(item.tabtext)
                            .font(isselect == item.id ? .system(size: 17, weight: .medium):  .system(size: 17, weight: .regular))
                            .padding(.vertical, 4)
                            .foregroundColor(Color("OnSurface"))
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(isselect == item.id ?  Color("Primary"): Color("Primary").opacity(0))
                            .frame(width: 58, height: 2)
                    }
                    .onTapGesture {
                        isselect = item.id
                    }
                }
            }
            .padding(.horizontal, 12)
        }
    }
}

struct TabtitleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}
