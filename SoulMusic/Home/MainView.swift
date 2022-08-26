//
//  MainView.swift
//  SoulMusic
//
//  Created by ZZZS on 16.8.22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model : Model
    @State  var arshow = false
    @AppStorage("islogin") var islogin = false
    @EnvironmentObject var MyClientdata : ClientData
    var body: some View {
        if islogin{
            switch model.select{
            case .listen:
                ContentView()
            case .musiclibrary:
                VStack{
                    Text("1")
                    Spacer()
                    TabbarView(arshow: $arshow)
                }
            case .message:
                NotView()
            case .profile:
                ProfileView().environmentObject(ClientData(FromOutMyClient: initMyClientData()))
            }
        }else{
            Signpage()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
