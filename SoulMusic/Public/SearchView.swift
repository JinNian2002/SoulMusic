//
//  SearchView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct SearchView: View {
    @Binding var placeholdertext: String
    @State var ontap = false
    var body: some View {
        HStack{
            HStack{
                Image("search")
                TextField("搜索用户、动态、音乐...", text: $placeholdertext)
                    .font(.system(size: 13.5, weight: .light))
            }
            .padding(.vertical ,4)
            .padding(.horizontal, 13)
            .background(Color("Input"), in: RoundedRectangle(cornerRadius: 50))
            Spacer()
            HStack{
                Image("plus")
            }
            .frame(width: 28, height: 28, alignment: .center)
            .background(Color("Primary"))
            .mask(Circle())
            .rotationEffect(Angle.degrees(ontap ? 45: 0))
            .onTapGesture {
                withAnimation(.spring(dampingFraction: 0.6, blendDuration: 0.1)){
                    ontap.toggle()
                }
            }
        }
        .padding(.horizontal, 12)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
