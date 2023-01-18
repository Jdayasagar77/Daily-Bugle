//
//  Daily_BugleApp.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 18/01/23.
//

import SwiftUI

@main
struct Daily_BugleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
