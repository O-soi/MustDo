//
//  MustDoApp.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/11.
//

import SwiftUI

@main
struct MustDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
