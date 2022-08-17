//
//  SettingView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.colorScheme) var currentMode
    var body: some View {
        VStack(spacing: 0){
            NavView(isshowfront: false, Navtitle: "设置")
            VStack(spacing: 12){
                VStack{
                    SettingCard(icon: currentMode == .dark ? "tool_dm":"tool", text: "账户与安全", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                }
                VStack{
                    SettingCard(icon: currentMode == .dark ? "bell_dm":"bell", text: "通知设置", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                    SettingCard(icon: currentMode == .dark ? "lock_dm":"lock", text: "隐私", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                    SettingCard(icon: currentMode == .dark ? "archive_dm":"archive", text: "辅助功能", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                    SettingCard(icon: currentMode == .dark ? "link_dm":"link", text: "平台链接管理", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                }
                VStack{
                    SettingCard(icon: currentMode == .dark ? "award_dm":"award", text: "个人认证", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                    SettingCard(icon: currentMode == .dark ? "help_dm":"help", text: "帮助与反馈", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                    SettingCard(icon: currentMode == .dark ? "info_dm":"info", text: "关于", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                    SettingCard(icon: currentMode == .dark ? "thumbs_dm":"thumbs", text: "推荐知音", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                    SettingCard(icon: currentMode == .dark ? "clipboard_dm":"clipboard", text: "用户协议", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                }
                VStack{
                    SettingCard(icon: currentMode == .dark ? "power_dm":"power", text: "退出登录", chevron: currentMode == .dark ? "chevron_24_front": "chevron_24_front_dm")
                }
            }
            Spacer()
        }
    }
}
//SettingCard
func SettingCard(icon: String, text: String, chevron: String) -> some View{
    HStack{
        Image(icon)
        Text(text)
        Spacer()
        Image(chevron)
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 12)
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
