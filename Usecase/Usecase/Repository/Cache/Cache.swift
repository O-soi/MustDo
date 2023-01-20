//
//  Cache.swift
//  Usecase
//
//  Created by 남기범 on 2023/01/14.
//

import Foundation
import CoreData
import OSLog

public final class Cache: PersistentContainerManagement {
    static public let shared: Cache = Cache()
}

public class PersistentContainerManagement {
    public var persistenContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Cache")
        container.loadPersistentStores { description, error in
            if let error = error {
                os_log("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    public var newBackgroundContext: NSManagedObjectContext {
        return persistenContainer.newBackgroundContext()
    }
    
    public func fetch<T: NSManagedObject>(_ request: NSFetchRequest<T>) -> [T] {
        return (try? persistenContainer.viewContext.fetch(request)) ?? []
    }
    
    public func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? persistenContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            os_log("Unable to save persistent stores: \(error)")
        }
    }
}
