//
//  SettingView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(spacing: 0){
            NavView(isshowfront: false, Navtitle: "设置")
            VStack(spacing: 12){
                VStack{
                    SettingCard(icon: "tool", text: "账户与安全")
                }
                VStack{
                    SettingCard(icon: "bell", text: "通知设置")
                    SettingCard(icon: "lock", text: "隐私")
                    SettingCard(icon: "archive", text: "辅助功能")
                    SettingCard(icon: "link", text: "平台链接管理")
                }
                VStack{
                    SettingCard(icon: "award", text: "个人认证")
                    SettingCard(icon: "help", text: "帮助与反馈")
                    SettingCard(icon: "info", text: "关于")
                    SettingCard(icon: "thumbs", text: "推荐知音")
                    SettingCard(icon: "clipboard", text: "用户协议")
                }
                VStack{
                    SettingCard(icon: "power", text: "退出登录")
                }
            }
            Spacer()
        }
    }
}
//SettingCard
func SettingCard(icon: String, text: String) -> some View{
    HStack{
        Image(icon)
        Text(text)
        Spacer()
        Image("chevron_24_front")
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 12)
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
