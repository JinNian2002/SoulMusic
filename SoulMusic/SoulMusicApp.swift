//
//  SoulMusicApp.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

@main
struct SoulMusicApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(Model())
        }
    }
}
