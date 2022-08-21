//
//  MenuView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.colorScheme) var currentMode
    @Binding var ontap : Bool
    @Binding var publishshow : Bool
    @Binding var texteditor : String
    @Binding var screenbutton : String
    @Binding var musicshow : Bool
    @Binding var albumname : String
    @Binding var noteshow : Bool
    @Binding var aria1 : Bool
    @Binding var aria2 : Bool
    @Binding var aria3 : Bool
    @Binding var textfeild1 : String
    @Binding var textfeild2 : String
    @Binding var textfeild3 : String
    var body: some View {
        VStack(alignment: .leading){
            Label("发布动态", image: currentMode == .dark ? "send_dm" : "send")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .onTapGesture {
                    ontap = false
                    publishshow = true
                }
                .fullScreenCover(isPresented: $publishshow) {
                    VStack{
                        FullScreenView(publishshow: $publishshow, fullScreentitle: "发布动态", screenbutton: "发布")
                        VStack{
                            TextField("键入文字...", text: $texteditor)
                                .padding(12)
                            Spacer()
                        }
                        
                    }
                    
                }
            Label("发布音乐", image: currentMode == .dark ? "upload_dm" :"upload")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .onTapGesture {
                    ontap = false
                    musicshow = true
                }
                .fullScreenCover(isPresented: $musicshow) {
                    VStack{
                        FullScreenView(publishshow: $musicshow, fullScreentitle: "发布音乐", screenbutton: "发布")
                        VStack{
                            Rectangle()
                                .frame(width: 144, height: 144)
                                .foregroundColor(Color("SecondaryContainer"))
                                .overlay(Image("plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 48))
                                .cornerRadius(6)
                            VStack(alignment: .leading, spacing: 18){
                                VStack(alignment: .leading, spacing: 6){
                                    Text("专辑名称/Name：")
                                    TextField("", text: $albumname)
                                        .textFieldStyle(.roundedBorder)
                                }
                                VStack(alignment: .leading, spacing: 6){
                                    Text("简介/Introduction：")
                                    TextField("", text: $albumname)
                                        .textFieldStyle(.roundedBorder)
                                }
                                VStack(alignment: .leading, spacing: 6){
                                    Text("添加歌曲/Add songs：")
                                    Rectangle()
                                        .frame(width: 54, height: 54)
                                        .foregroundColor(Color("Background"))
                                        .overlay(Image("plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24))
                                        .cornerRadius(6)
                                }
                                VStack(alignment: .leading, spacing: 6){
                                    Text("添加视频/Add videos：")
                                    Rectangle()
                                        .frame(width: 54, height: 54)
                                        .foregroundColor(Color("Background"))
                                        .overlay(Image("plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24))
                                        .cornerRadius(6)
                                }
                            }
                            .font(.system(size: 14))
                            .padding(.top, 42)
                            Spacer()
                        }
                        .padding(.horizontal, 24)
                        .background(Color("Background"))
                    }
                    
                }
            Label("AR社区文件制作", image: currentMode == .dark ? "filetext_dm" :"filetext")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .onTapGesture {
                    ontap = false
                }
            Label("便携记录", image: currentMode == .dark ? "edit_dm" :"edit")
                .font(.system(size: 14))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .onTapGesture {
                    ontap = false
                    noteshow = true
                }
                .fullScreenCover(isPresented: $noteshow) {
                    VStack{
                        FullScreenView(publishshow: $noteshow, fullScreentitle: "便携记录", screenbutton: "        ")
                        ScrollView{
                            VStack(spacing: 0){
                                AriaCard(arianum: 1, aria: $aria1, textfeild: $textfeild1)
                                AriaCard(arianum: 2, aria: $aria2, textfeild: $textfeild2)
                                AriaCard(arianum: 3, aria: $aria3, textfeild: $textfeild3)
                            }
                        }
                        .background(Color("Background"))
                    }
                    
                }
        }
        .padding(.vertical, 4)
        .frame(width: UIScreen.main.bounds.width / 2 - 12, alignment: .leading)
        .foregroundColor(Color("OnSurface"))
        .background(Color("Surface"), in: RoundedRectangle(cornerRadius: 6))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
