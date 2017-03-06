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

}
