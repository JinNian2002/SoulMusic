//
//  SearchDetailView.swift
//  SoulMusic
//
//  Created by ZZZS on 18.8.22.
//

import SwiftUI

struct SearchDetailView: View {
    @Environment(\.colorScheme) var currentMode
    @Binding var issearch : Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("取消")
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color("Surface"))
                    .onTapGesture {
                        hidekeyboard()
                        withAnimation (.easeIn(duration: 0.1)){
                            issearch = false
                        }
                        
                    }
            }
            VStack{
                VStack{
                    HStack{
                        Text("历史记录")
                            .font(.system(size: 17, weight: .medium))
                        Spacer()
                        Image(currentMode == .dark ? "trash_20_dm" : "trash_20")
                            .padding(12)
                    }
                    .padding(.vertical, 2)
                    VStack{
                        HStack{
                            Text("鼓浪屿AR")
                                .searchButton()
                            Text("宽窄巷子")
                                .searchButton()
                            Text("喷绘挑战")
                                .searchButton()
                            Spacer()
                        }
                        HStack{
                            Text("情人玫瑰")
                                .searchButton()
                            Text("信物")
                                .searchButton()
                            Spacer()
                            Image("chevron_24_front")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(12)
                                .rotationEffect(Angle(degrees: 90))
                        }
                    }
                    HStack{
                        Text("热门搜索")
                            .font(.system(size: 17, weight: .medium))
                        Spacer()
                    }
                    .padding(.vertical, 6)
                    HStack(spacing: 0){
                        VStack(alignment: .leading, spacing: 6){
                            rankcard(num: 1, text: "标志传递挑战")
                            rankcard(num: 2, text: "信物")
                            rankcard(num: 3, text: "宽窄巷子")
                            rankcard(num: 4, text: "信物传递")
                            rankcard(num: 5, text: "情人玫瑰")
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 6){
                            rankcard(num: 6, text: "风景")
                            rankcard(num: 7, text: "美丽花朵")
                            rankcard(num: 8, text: "亲近自然")
                            rankcard(num: 9, text: "发现")
                            rankcard(num: 10, text: "周边")
                        }
                        
                        Spacer()
                    }
                    .font(.system(size: 15))
                }
                .padding(.leading, 24)
                .padding(.trailing, 12)
                Spacer()
            }
            .background(Color("Surface"))
        }
        .foregroundColor(Color("OnSurface"))
    }
}

func rankcard(num: Int, text: String) -> some View {
    HStack(spacing: 5){
        Text("\(num)")
        Text(text)
    }
}
