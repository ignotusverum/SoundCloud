//
//  Playlist.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Human Ventures Co. All rights reserved.
//

import CoreStore
import SwiftyJSON

struct PlaylistJSON {
    
    static let duration = "duration"
    static let releaseDay = "release_day"
    static let permalinkURL = "permalink_url"
    static let genre = "genre"
    static let permailink = "permalink"
    static let purchaseURL = "purchase_url"
    static let releaseMonth = "release_month"
    static let description = "description"
    static let uri = "uri"
    static let labelName = "label_name"
    static let tagList = "tag_list"
    static let releaseYear = "release_year"
    static let trackCount = "track_count"
    static let userID = "user_id"
    static let lastModified = "last_modified"
    static let license = "license"
    static let tracks = "tracks"
}

@objc(Playlist)
public class Playlist: _Playlist {

    public override func update(from source: JSON, in transaction: BaseDataTransaction) throws {
        try super.update(from: source, in: transaction)
        
        /// Duration
        duration = source[PlaylistJSON.duration].number
        
        /// Release Day
        releaseDay = source[PlaylistJSON.releaseDay].date
        
        /// Pemalink
        permalinkString = source[PlaylistJSON.permalinkURL].string
        
        /// Permalink URL
        permalinkURLString = source[PlaylistJSON.permailink].string
        
        /// Release month
        releaseMonth = source[PlaylistJSON.releaseMonth].number
        
        /// Description
        playlistDescription = source[PlaylistJSON.description].string
        
        /// URI
        uriString = source[PlaylistJSON.uri].string
        
        /// Label Name
        labelName = source[PlaylistJSON.labelName].string
        
        /// Tag list
        tagList = source[PlaylistJSON.tagList].string
        
        /// Release Year
        releaseYear = source[PlaylistJSON.releaseYear].number
        
        /// Track Count
        trackCount = source[PlaylistJSON.trackCount].number
        
        /// User ID
        userID = source[PlaylistJSON.userID].number
        
        /// Last Modified
        lastModified = source[PlaylistJSON.lastModified].date
        
        /// Licence
        license = source[PlaylistJSON.license].string
        
        /// Tracks
        /// Update Model
    }
}
