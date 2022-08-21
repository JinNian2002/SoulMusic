//
//  SearchView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct SearchView: View {
    @Binding var placeholdertext: String
    @Binding var ontap : Bool
    @Binding var issearch : Bool
    var body: some View {
        HStack{
            HStack{
                Image("search")
                TextField("搜索用户、动态、音乐...", text: $placeholdertext)
                    .font(.system(size: 13.5, weight: .light))
                    .onTapGesture {
                        withAnimation (.easeIn(duration: 0.1)){
                            issearch = true
                        }
                    }
                if issearch {
                    Button{
                        placeholdertext = ""
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .foregroundColor(.black.opacity(0.4))
                }
            }
            .padding(.vertical ,4)
            .padding(.horizontal, 13)
            .background(Color("Input"), in: RoundedRectangle(cornerRadius: 50))
            
            Spacer()
            HStack{
                Image("plus")
            }
            .circleIcon(width: 28, height: 28)
            .rotationEffect(Angle.degrees(ontap ? 45: 0))
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.1)){
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
            .environmentObject(Model())
    }
}
