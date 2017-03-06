// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Playlist.swift instead.

import Foundation
import CoreData

public enum PlaylistAttributes: String {
    case duration = "duration"
    case genre = "genre"
    case id = "id"
    case labelName = "labelName"
    case lastModified = "lastModified"
    case license = "license"
    case permalingString = "permalingString"
    case permalinkString = "permalinkString"
    case playlistDescription = "playlistDescription"
    case purchaseString = "purchaseString"
    case releaseMonth = "releaseMonth"
    case releaseYear = "releaseYear"
    case release_day = "release_day"
    case tagList = "tagList"
    case trackCount = "trackCount"
    case uriString = "uriString"
    case userID = "userID"
}

public enum PlaylistRelationships: String {
    case tracks = "tracks"
}

open class _Playlist: TMManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Playlist"
    }

    open class func entity(_ managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Playlist.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var duration: NSNumber?

    @NSManaged open
    var genre: String?

    @NSManaged public
    var id: NSNumber?

    @NSManaged open
    var labelName: String?

    @NSManaged open
    var lastModified: Date?

    @NSManaged open
    var license: String?

    @NSManaged open
    var permalingString: String?

    @NSManaged open
    var permalinkString: String?

    @NSManaged open
    var playlistDescription: String?

    @NSManaged open
    var purchaseString: String?

    @NSManaged public
    var releaseMonth: NSNumber?

    @NSManaged public
    var releaseYear: NSNumber?

    @NSManaged open
    var release_day: Date?

    @NSManaged open
    var tagList: String?

    @NSManaged public
    var trackCount: NSNumber?

    @NSManaged open
    var uriString: String?

    @NSManaged public
    var userID: NSNumber?

    // MARK: - Relationships

    @NSManaged open
    var tracks: NSSet

    open func tracksSet() -> NSMutableSet {
        return self.tracks.mutableCopy() as! NSMutableSet
    }

}

extension _Playlist {

    open func addTracks(_ objects: NSSet) {
        let mutable = self.tracks.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.tracks = mutable.copy() as! NSSet
    }

    open func removeTracks(_ objects: NSSet) {
        let mutable = self.tracks.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.tracks = mutable.copy() as! NSSet
    }

    open func addTracksObject(_ value: Track) {
        let mutable = self.tracks.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.tracks = mutable.copy() as! NSSet
    }

    open func removeTracksObject(_ value: Track) {
        let mutable = self.tracks.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.tracks = mutable.copy() as! NSSet
    }

}
