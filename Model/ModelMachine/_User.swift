// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.swift instead.

import Foundation
import CoreData

public enum UserAttributes: String {
    case avatarURLString = "avatarURLString"
    case id = "id"
    case kind = "kind"
    case lastModified = "lastModified"
    case permalinkString = "permalinkString"
    case permalinkURLString = "permalinkURLString"
    case uriString = "uriString"
    case username = "username"
}

public enum UserRelationships: String {
    case track = "track"
}

open class _User: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "User"
    }

    open class func entity(_ managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _User.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var avatarURLString: String?

    @NSManaged public
    var id: NSNumber?

    @NSManaged open
    var kind: String?

    @NSManaged open
    var lastModified: Date?

    @NSManaged open
    var permalinkString: String?

    @NSManaged open
    var permalinkURLString: String?

    @NSManaged open
    var uriString: String?

    @NSManaged open
    var username: String?

    // MARK: - Relationships

    @NSManaged open
    var track: Track?

}

