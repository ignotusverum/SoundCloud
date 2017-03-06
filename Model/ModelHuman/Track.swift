//
//  Track.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Human Ventures Co. All rights reserved.
//

import CoreData
import SwiftyJSON

@objc(Track)
public class Track: _Track {

	// MARK: - Fetching logic

	class func fetchObjectWithID(objectID: String, context: NSManagedObjectContext) throws -> Track? {

        return try Track.modelFetchWithID(objectID, context:context) as? Track
    }

    class func fetchOrInsertWithJSON(json: JSON, context: NSManagedObjectContext) throws -> Track? {

        return try Track.modelFetchOrInsertWithJSON(json, context: context) as? Track
    }

    override func setValueWithJSON(json: JSON, context: NSManagedObjectContext) {

		super.setValueWithJSON(json, context: context)

		if self.modelObjectID != nil {

			if let _artworkURLString = json["artworkURLString"].String {
				self.artworkURLString = _artworkURLString
			}

			if let _attachmentsURIString = json["attachmentsURIString"].String {
				self.attachmentsURIString = _attachmentsURIString
			}

			if let _bpm = json["bpm"].NSNumber {
				self.bpm = _bpm
			}

			if let _commentCount = json["commentCount"].NSNumber {
				self.commentCount = _commentCount
			}

			if let _commentable = json["commentable"].NSNumber {
				self.commentable = _commentable
			}

			if let _createdAt = json["createdAt"].Date {
				self.createdAt = _createdAt
			}

			if let _downloadCount = json["downloadCount"].NSNumber {
				self.downloadCount = _downloadCount
			}

			if let _downloadable = json["downloadable"].NSNumber {
				self.downloadable = _downloadable
			}

			if let _duration = json["duration"].NSNumber {
				self.duration = _duration
			}

			if let _embeddableBy = json["embeddableBy"].String {
				self.embeddableBy = _embeddableBy
			}

			if let _favoritingsCount = json["favoritingsCount"].NSNumber {
				self.favoritingsCount = _favoritingsCount
			}

			if let _genre = json["genre"].String {
				self.genre = _genre
			}

			if let _id = json["id"].NSNumber {
				self.id = _id
			}

			if let _isrc = json["isrc"].String {
				self.isrc = _isrc
			}

			if let _keySignature = json["keySignature"].String {
				self.keySignature = _keySignature
			}

			if let _kind = json["kind"].String {
				self.kind = _kind
			}

			if let _labelID = json["labelID"].NSNumber {
				self.labelID = _labelID
			}

			if let _lastMofied = json["lastMofied"].Date {
				self.lastMofied = _lastMofied
			}

			if let _lastName = json["lastName"].String {
				self.lastName = _lastName
			}

			if let _license = json["license"].String {
				self.license = _license
			}

			if let _originalContentSize = json["originalContentSize"].NSNumber {
				self.originalContentSize = _originalContentSize
			}

			if let _originalFormat = json["originalFormat"].String {
				self.originalFormat = _originalFormat
			}

			if let _permalink = json["permalink"].String {
				self.permalink = _permalink
			}

			if let _permalinkURLString = json["permalinkURLString"].String {
				self.permalinkURLString = _permalinkURLString
			}

			if let _playbackCount = json["playbackCount"].NSNumber {
				self.playbackCount = _playbackCount
			}

			if let _purchaseTitle = json["purchaseTitle"].String {
				self.purchaseTitle = _purchaseTitle
			}

			if let _purchaseUrlString = json["purchaseUrlString"].String {
				self.purchaseUrlString = _purchaseUrlString
			}

			if let _releaseDay = json["releaseDay"].NSNumber {
				self.releaseDay = _releaseDay
			}

			if let _releaseMonth = json["releaseMonth"].NSNumber {
				self.releaseMonth = _releaseMonth
			}

			if let _releaseString = json["releaseString"].String {
				self.releaseString = _releaseString
			}

			if let _releaseYear = json["releaseYear"].NSNumber {
				self.releaseYear = _releaseYear
			}

			if let _sharing = json["sharing"].NSNumber {
				self.sharing = _sharing
			}

			if let _state = json["state"].String {
				self.state = _state
			}

			if let _streamURLString = json["streamURLString"].String {
				self.streamURLString = _streamURLString
			}

			if let _streamable = json["streamable"].NSNumber {
				self.streamable = _streamable
			}

			if let _tagList = json["tagList"].String {
				self.tagList = _tagList
			}

			if let _title = json["title"].String {
				self.title = _title
			}

			if let _trackDescription = json["trackDescription"].String {
				self.trackDescription = _trackDescription
			}

			if let _trackType = json["trackType"].String {
				self.trackType = _trackType
			}

			if let _uriString = json["uriString"].String {
				self.uriString = _uriString
			}

			if let _userID = json["userID"].NSNumber {
				self.userID = _userID
			}

			if let _videoURLString = json["videoURLString"].String {
				self.videoURLString = _videoURLString
			}

			if let _waveformURLString = json["waveformURLString"].String {
				self.waveformURLString = _waveformURLString
			}

		}
	}
}
