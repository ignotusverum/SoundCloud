//
//  User.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Human Ventures Co. All rights reserved.
//

import CoreStore
import SwiftyJSON

struct UserJSON {
    
    static let kind = "kind"
    static let permalink = "permalink"
    static let username = "username"
    static let lastModified = "last_modified"
    static let uri = "uri"
    static let permalinkUrl = "permalink_url"
    static let avatarUrl = "avatar_url"
}

@objc(User)
public class User: _User {

    public override func update(from source: JSON, in transaction: BaseDataTransaction) throws {
        try super.update(from: source, in: transaction)
        
        /// Kind
        kind = source[UserJSON.kind].string
        
        /// Pemalink
        permalinkString = source[UserJSON.permalink].string
        
        /// Permalink
        permalinkURLString = source[UserJSON.permalinkUrl].string
        
        /// Username
        username = source[UserJSON.username].string
        
        /// uri
        uriString = source[UserJSON.uri].string
        
        /// Avatar uri
        avatarURLString = source[UserJSON.avatarUrl].string
    }
}
