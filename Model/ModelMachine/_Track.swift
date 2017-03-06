// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Track.swift instead.

import Foundation
import CoreData

public enum TrackAttributes: String {
    case artworkURLString = "artworkURLString"
    case attachmentsURIString = "attachmentsURIString"
    case bpm = "bpm"
    case commentCount = "commentCount"
    case commentable = "commentable"
    case createdAt = "createdAt"
    case downloadCount = "downloadCount"
    case downloadable = "downloadable"
    case duration = "duration"
    case embeddableBy = "embeddableBy"
    case favoritingsCount = "favoritingsCount"
    case genre = "genre"
    case isrc = "isrc"
    case keySignature = "keySignature"
    case kind = "kind"
    case labelID = "labelID"
    case lastMofied = "lastMofied"
    case lastName = "lastName"
    case license = "license"
    case originalContentSize = "originalContentSize"
    case originalFormat = "originalFormat"
    case permalink = "permalink"
    case permalinkURLString = "permalinkURLString"
    case playbackCount = "playbackCount"
    case purchaseTitle = "purchaseTitle"
    case purchaseUrlString = "purchaseUrlString"
    case releaseDay = "releaseDay"
    case releaseMonth = "releaseMonth"
    case releaseString = "releaseString"
    case releaseYear = "releaseYear"
    case sharing = "sharing"
    case state = "state"
    case streamURLString = "streamURLString"
    case streamable = "streamable"
    case tagList = "tagList"
    case title = "title"
    case trackDescription = "trackDescription"
    case trackType = "trackType"
    case uriString = "uriString"
    case userID = "userID"
    case videoURLString = "videoURLString"
    case waveformURLString = "waveformURLString"
}

public enum TrackRelationships: String {
    case playlist = "playlist"
    case user = "user"
}

open class _Track: Model {

    // MARK: - Class methods

    override open class func entityName () -> String {
        return "Track"
    }

    override open class func entity(_ managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Track.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var artworkURLString: String?

    @NSManaged open
    var attachmentsURIString: String?

    @NSManaged public
    var bpm: NSNumber?

    @NSManaged public
    var commentCount: NSNumber?

    @NSManaged public
    var commentable: NSNumber?

    @NSManaged open
    var createdAt: Date?

    @NSManaged public
    var downloadCount: NSNumber?

    @NSManaged public
    var downloadable: NSNumber?

    @NSManaged public
    var duration: NSNumber?

    @NSManaged open
    var embeddableBy: String?

    @NSManaged public
    var favoritingsCount: NSNumber?

    @NSManaged open
    var genre: String?

    @NSManaged open
    var isrc: String?

    @NSManaged open
    var keySignature: String?

    @NSManaged open
    var kind: String?

    @NSManaged public
    var labelID: NSNumber?

    @NSManaged open
    var lastMofied: Date?

    @NSManaged open
    var lastName: String?

    @NSManaged open
    var license: String?

    @NSManaged public
    var originalContentSize: NSNumber?

    @NSManaged open
    var originalFormat: String?

    @NSManaged open
    var permalink: String?

    @NSManaged open
    var permalinkURLString: String?

    @NSManaged public
    var playbackCount: NSNumber?

    @NSManaged open
    var purchaseTitle: String?

    @NSManaged open
    var purchaseUrlString: String?

    @NSManaged public
    var releaseDay: NSNumber?

    @NSManaged public
    var releaseMonth: NSNumber?

    @NSManaged open
    var releaseString: String?

    @NSManaged public
    var releaseYear: NSNumber?

    @NSManaged public
    var sharing: NSNumber?

    @NSManaged open
    var state: String?

    @NSManaged open
    var streamURLString: String?

    @NSManaged public
    var streamable: NSNumber?

    @NSManaged open
    var tagList: String?

    @NSManaged open
    var title: String?

    @NSManaged open
    var trackDescription: String?

    @NSManaged open
    var trackType: String?

    @NSManaged open
    var uriString: String?

    @NSManaged public
    var userID: NSNumber?

    @NSManaged open
    var videoURLString: String?

    @NSManaged open
    var waveformURLString: String?

    // MARK: - Relationships

    @NSManaged open
    var playlist: Playlist?

    @NSManaged open
    var user: User?

}

