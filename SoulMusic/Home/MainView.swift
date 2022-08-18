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
            VStack{
                Text("1")
                Spacer()
                TabbarView()
            }
            
        case .arcommunity:
            VStack{
                Text("1")
                Spacer()
                TabbarView()
            }
        case .message:
            VStack{
                Text("1")
                Spacer()
                TabbarView()
            }
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
