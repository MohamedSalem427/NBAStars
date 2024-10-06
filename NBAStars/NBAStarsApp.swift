//
//  NBAStarsApp.swift
//  NBAStars
//
//  Created by Mohamed Salem on 05/10/2024.
//

import SwiftUI

@main
struct NBAStarsApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            PlayerListView(viewModel: PlayerListViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { oldValue, newValue in
            if scenePhase == .background {
                do {
                    try persistenceController.container.viewContext.save()
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
