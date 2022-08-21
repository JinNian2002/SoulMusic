//
//  MoreView.swift
//  SoulMusic
//
//  Created by ZZZS on 21.8.22.
//

import SwiftUI

struct MoreView: View {
    @Binding var moreshow : Bool
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Text("更多")
                    Spacer()
                }
                
                    .padding(.top, 12)
                    .padding(.bottom, 24)
                VStack{
                    HStack{
                        Image("report")
                    }
                    .circleIcon(width: 40, height: 40)
                    Text("举报")
                        .font(.system(size: 14))
                }
                
                HStack{
                    Spacer()
                    Text("取消")
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.bottom, 48)
                .onTapGesture {
                    withAnimation (.easeIn(duration: 0.25)){
                        moreshow = false
                    }
                }
            }
            .background(Color("Surface"),in: RoundedRectangle(cornerRadius: 15))
        }
        .ignoresSafeArea()
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(moreshow: .constant(false))
    }
}
