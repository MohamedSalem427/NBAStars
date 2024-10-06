//
//  DataModel.swift
//  NBAStars
//
//  Created by Mohamed Salem on 05/10/2024.
//

import Foundation
import CoreData

final class TeamModel: NSManagedObject,Identifiable,Listable {
   @NSManaged var name: String
   @NSManaged var logo: Data
   @NSManaged var displayOrder: Int32
   @NSManaged var playerSet:NSSet
    var players:[PlayerModel] {
        playerSet.map {
            $0 as! PlayerModel
        }
    }
    
    func update(with info:[TeamModelKey: Any]){
        if let newName = info[.name] as? String { name = newName }
        if let newLogo = info[.logo] as? Data {logo = newLogo}
        if let newDisplayOrder = info[.displayOrder] as? Int32 {displayOrder = newDisplayOrder}
    }
    
 
}

final class PlayerModel: NSManagedObject,Identifiable,Listable {
    @NSManaged var name: String
    @NSManaged var photo: Data
    @NSManaged var displayOrder: Int32
    @NSManaged var team:TeamModel
    
    func update(with info:[PlayerModelKey: Any]){
        if let newName = info[.name] as? String { name = newName }
        if let newLogo = info[.photo] as? Data {photo = newLogo}
        if let newDisplayOrder = info[.displayOrder] as? Int32 {displayOrder = newDisplayOrder}
        if let newTeam = info[.team] as? TeamModel {team = newTeam}
    }
}



enum TeamModelKey {
    case name,logo,displayOrder,playerSet
}
enum PlayerModelKey {
    case name,photo,displayOrder,team
}
