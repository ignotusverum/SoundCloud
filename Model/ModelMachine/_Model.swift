// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Model.swift instead.

import Foundation
import CoreData

public enum ModelAttributes: String {
    case id = "id"
}

open class _Model: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Model"
    }

    open class func entity(_ managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Model.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var id: NSNumber!

    // MARK: - Relationships

}

