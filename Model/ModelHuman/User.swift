//
//  User.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Human Ventures Co. All rights reserved.
//

import CoreData
import SwiftyJSON

@objc(User)
public class User: _User {

	// MARK: - Fetching logic

	class func fetchObjectWithID(objectID: String, context: NSManagedObjectContext) throws -> User? {

        return try User.modelFetchWithID(objectID, context:context) as? User
    }

    class func fetchOrInsertWithJSON(json: JSON, context: NSManagedObjectContext) throws -> User? {

        return try User.modelFetchOrInsertWithJSON(json, context: context) as? User
    }

    override func setValueWithJSON(json: JSON, context: NSManagedObjectContext) {

		super.setValueWithJSON(json, context: context)

		if self.modelObjectID != nil {

			if let _avatarURLString = json["avatarURLString"].String {
				self.avatarURLString = _avatarURLString
			}

			if let _id = json["id"].NSNumber {
				self.id = _id
			}

			if let _kind = json["kind"].String {
				self.kind = _kind
			}

			if let _lastModified = json["lastModified"].Date {
				self.lastModified = _lastModified
			}

			if let _permalinkString = json["permalinkString"].String {
				self.permalinkString = _permalinkString
			}

			if let _permalinkURLString = json["permalinkURLString"].String {
				self.permalinkURLString = _permalinkURLString
			}

			if let _uriString = json["uriString"].String {
				self.uriString = _uriString
			}

			if let _username = json["username"].String {
				self.username = _username
			}

		}
	}
}
