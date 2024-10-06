//
//  ListableProtocol.swift
//  NBAStars
//
//  Created by Mohamed Salem on 05/10/2024.
//

import CoreData
protocol Listable where Self: NSManagedObject {
   static func sortedFetchRequest(predicate: NSPredicate?) -> NSFetchRequest<Self>
    var displayOrder: Int32 { get set }
}

extension Listable {
    static func sortedFetchRequest(predicate: NSPredicate? = nil) -> NSFetchRequest<Self> {
        let req:NSFetchRequest<Self> = NSFetchRequest(entityName: String(describing: Self.self))
        req.predicate = predicate
        req.sortDescriptors = [
        NSSortDescriptor(key: "displayOrder", ascending: true)
        ]
        return req
    }
}
