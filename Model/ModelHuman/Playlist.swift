//
//  Playlist.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Human Ventures Co. All rights reserved.
//

import CoreData
import SwiftyJSON

@objc(Playlist)
public class Playlist: _Playlist {

	// MARK: - Fetching logic

	class func fetchObjectWithID(objectID: String, context: NSManagedObjectContext) throws -> Playlist? {

        return try Playlist.modelFetchWithID(objectID, context:context) as? Playlist
    }

    class func fetchOrInsertWithJSON(json: JSON, context: NSManagedObjectContext) throws -> Playlist? {

        return try Playlist.modelFetchOrInsertWithJSON(json, context: context) as? Playlist
    }

    override func setValueWithJSON(json: JSON, context: NSManagedObjectContext) {

		super.setValueWithJSON(json, context: context)

		if self.modelObjectID != nil {

			if let _duration = json["duration"].NSNumber {
				self.duration = _duration
			}

			if let _genre = json["genre"].String {
				self.genre = _genre
			}

			if let _id = json["id"].NSNumber {
				self.id = _id
			}

			if let _labelName = json["labelName"].String {
				self.labelName = _labelName
			}

			if let _lastModified = json["lastModified"].Date {
				self.lastModified = _lastModified
			}

			if let _license = json["license"].String {
				self.license = _license
			}

			if let _permalingString = json["permalingString"].String {
				self.permalingString = _permalingString
			}

			if let _permalinkString = json["permalinkString"].String {
				self.permalinkString = _permalinkString
			}

			if let _playlistDescription = json["playlistDescription"].String {
				self.playlistDescription = _playlistDescription
			}

			if let _purchaseString = json["purchaseString"].String {
				self.purchaseString = _purchaseString
			}

			if let _releaseMonth = json["releaseMonth"].NSNumber {
				self.releaseMonth = _releaseMonth
			}

			if let _releaseYear = json["releaseYear"].NSNumber {
				self.releaseYear = _releaseYear
			}

			if let _release_day = json["release_day"].Date {
				self.release_day = _release_day
			}

			if let _tagList = json["tagList"].String {
				self.tagList = _tagList
			}

			if let _trackCount = json["trackCount"].NSNumber {
				self.trackCount = _trackCount
			}

			if let _uriString = json["uriString"].String {
				self.uriString = _uriString
			}

			if let _userID = json["userID"].NSNumber {
				self.userID = _userID
			}

		}
	}
}
