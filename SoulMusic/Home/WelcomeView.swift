//
//  WelcomeView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct WelcomeView: View {
    @State var showHome = false
    var body: some View {
        ZStack{
            Color("Surface").edgesIgnoringSafeArea(.all)
            Image("Logo_text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3)
                .offset(y: -UIScreen.main.bounds.height / 4)
            if showHome{
                    MainView()
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                withAnimation {
                    self.showHome.toggle()
                }
            }
        })
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(Model())
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
