//
//  SoulMusicApp.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI
import Parse
@main
struct SoulMusicApp: App {
    let persistenceController = PersistenceController.shared
    init(){
        let parseconfig = ParseClientConfiguration {
            $0.applicationId = "8888"
            $0.clientKey = "8888"
            $0.server = "http://47.99.33.134:1337/parse"
        }
        Parse.initialize(with: parseconfig)
    }
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(Model())
        }
    }
}
