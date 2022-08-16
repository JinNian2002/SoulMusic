//
//  MainView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model : Model
    var body: some View {
        switch model.select{
        case .listen:
            ContentView()
        case .musiclibrary:
            Text("1")
        case .arcommunity:
            Text("1")
        case .message:
            Text("1")
        case .profile:
            ProfileView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
    }
}
