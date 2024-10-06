//
//  PlayerListViewModel.swift
//  NBAStars
//
//  Created by Mohamed Salem on 05/10/2024.
//

import Combine
import CoreData
import UIKit

class PlayerListViewModel: ObservableObject {
    var players: [PlayerModel] { moc.fetchPlayers() }
    private var moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.moc = moc
    }
    
    func delete(at index: Int) {
        objectWillChange.send()
        moc.delete(moc.fetchPlayers()[index])
    }
    
    func loadSampleData() {
        objectWillChange.send()
        let team = TeamModel(context: moc)
        for (index, name) in ["Jordan", "Johnson", "Bird"].enumerated() {
            let player = PlayerModel(context: moc)
            player.name = name
            player.photo = UIImage(systemName: "person.fill")!.jpegData(compressionQuality: 1)!
            player.displayOrder = Int32(index)
            player.team = team
        }
    }
}

extension NSManagedObjectContext {
    func fetchPlayers() -> [PlayerModel] {
        try! fetch(PlayerModel.sortedFetchRequest())
    }
}
