//
//  Track.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Human Ventures Co. All rights reserved.
//

import CoreStore
import SwiftyJSON

struct TrackJSON {
    
    static let kind = "kind"
    static let createdAt = "created_at"
    static let userID = "user_id"
    static let duration = "duration"
    static let commentable = "commentable"
    static let state = "state"
    static let originalContentSize = "original_content_size"
    static let lastModified = "last_modified"
    static let sharing = "sharing"
    static let tagList = "tag_list"
    static let permalink = "permalink"
    static let streamable = "streamable"
    static let embeddableBy = "embeddable_by"
    static let downloadable = "downloadable"
    static let purchaseURL = "purchase_url"
    static let labelID = "label_id"
    static let purchaseTitle = "purchase_title"
    static let genre = "genre"
    static let title = "title"
    static let description = "description"
    static let labelName = "label_name"
    static let release = "release"
    static let trackType = "track_type"
    static let keySignature = "key_signature"
    static let isrc = "isrc"
    static let videoURL = "video_url"
    
    static let bpm = "bpm"
    static let releaseYear = "release_year"
    static let releaseMonth = "release_month"
    static let releaseDat = "release_day"
    static let originalFormat = "original_format"
    static let license = "license"
    static let uri = "uri"
    
    static let user = "user"
    static let attachmentsUri = "attachments_uri"
    static let permalinkURL = "permalink_url"
    static let artworkURL = "artwork_url"
    static let waveformURL = "waveform_url"
    
    static let streamURL = "stream_url"
    static let playbackCount = "playback_count"
    static let downloadCount = "download_count"
    static let favoritingsCount = "favoritings_count"
    static let commentCount = "comment_count"
}

@objc(Track)
public class Track: _Track {

    var artworkURL: URL? {
        
        return URL(string: artworkURLString ?? "")
    }
    
    public override func update(from source: JSON, in transaction: BaseDataTransaction) throws {
        try super.update(from: source, in: transaction)
        
        /// Kind
        kind = source[TrackJSON.kind].string
        
        /// Created At
        createdAt = source[TrackJSON.createdAt].date
        
        /// User ID
        userID = source[TrackJSON.userID].number
        
        /// Duration
        duration = source[TrackJSON.duration].number
        
        /// Commentable
        commentable = source[TrackJSON.commentable].number
        
        /// State
        state = source[TrackJSON.state].string

        /// Original Content Size
        originalContentSize = source[TrackJSON.originalContentSize].number
        
        /// Last Modified
        lastMofied = source[TrackJSON.lastModified].date
        
        /// Sharing
        sharing = source[TrackJSON.sharing].number
        
        /// Tag List
        tagList = source[TrackJSON.tagList].string
        
        /// Permalink 
        permalink = source[TrackJSON.permalink].string
        
        /// Streamable
        streamable = source[TrackJSON.streamable].number
        
        /// Embeddable By
        embeddableBy = source[TrackJSON.embeddableBy].string
        
        /// Downloadable
        downloadable = source[TrackJSON.downloadable].number
        
        /// Purchase URL
        purchaseUrlString = source[TrackJSON.purchaseURL].string
        
        /// Label ID
        labelID = source[TrackJSON.labelID].number
        
        /// Purchase Title
        purchaseTitle = source[TrackJSON.purchaseTitle].string
        
        /// Label ID
        labelID = source[TrackJSON.labelID].number
        
        /// Genre
        genre = source[TrackJSON.genre].string
        
        /// Title
        title = source[TrackJSON.title].string

        /// Label Name
        trackDescription = source[TrackJSON.description].string
        
        /// Release
        releaseString = source[TrackJSON.release].string
        
        /// Track Type
        trackType = source[TrackJSON.trackType].string

        /// Track signature
        keySignature = source[TrackJSON.keySignature].string
        
        /// isrc
        isrc = source[TrackJSON.isrc].string
        
        /// Video URL
        videoURLString = source[TrackJSON.videoURL].string
        
        /// bmp
        bpm = source[TrackJSON.bpm].number
        
        /// Relase Year
        releaseYear = source[TrackJSON.releaseYear].number
        
        /// Release Month
        releaseMonth = source[TrackJSON.releaseMonth].number
        
        /// Release day
        releaseDay = source[TrackJSON.releaseDat].number
        
        /// Original format
        originalFormat = source[TrackJSON.originalFormat].string
        
        /// License
        license = source[TrackJSON.license].string
        
        /// URI
        uriString = source[TrackJSON.uri].string

        /// User
        
        /// Permalink URL
        permalinkURLString = source[TrackJSON.permalinkURL].string
        
        /// artwork URL
        artworkURLString = source[TrackJSON.artworkURL].string
        
        /// Stream URL
        streamURLString = source[TrackJSON.streamURL].string

        /// User
        let tempUser = source[TrackJSON.user].json
        if let userJSON = tempUser {
            
            let user = try transaction.importUniqueObject(Into<User>(), source: userJSON)
            self.user = user
        }

//        static let attachmentsUri = "attachments_uri"
//        static let permalinkURL = "permalink_url"
//        static let artworkURL = "artwork_url"
//        static let waveformURL = "waveform_url"
//        
//        static let streamURL = "stream_url"
//        static let playbackCount = "playback_count"
//        static let downloadCount = "download_count"
//        static let favoritingsCount = "favoritings_count"
//        static let commentCount = "comment_count"
    }
}
