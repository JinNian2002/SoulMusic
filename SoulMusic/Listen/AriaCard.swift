//
//  AriaCard.swift
//  SoulMusic
//
//  Created by ZZZS on 21.8.22.
//

import SwiftUI

struct AriaCard: View {
    var arianum : Int
    @Binding var aria : Bool
    @Binding var textfeild : String
    @Environment(\.colorScheme) var currentMode
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Text("唱段\(arianum)")
                Spacer()
                Image(currentMode == .dark ? "chevron_24_front_dm": "chevron_24_front")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(20)
                    .rotationEffect(Angle(degrees: aria ? 90 : 0))
            }
            .padding(.leading, 24)
            .padding(.trailing, 14)
            .onTapGesture {
                withAnimation {
                    aria.toggle()
                }
            }
            Divider()
            if aria{
                VStack(spacing: 0){
                    TextField("键入文字...", text: $textfeild)
                        .padding(12)
                    Spacer()
                    Divider()
                }
                .frame(height: UIScreen.main.bounds.height / 2)
            }
        }
    }
}
