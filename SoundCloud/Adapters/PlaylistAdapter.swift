//
//  PlaylistAdapter.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 3/5/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import PromiseKit
import CoreStore

class PlaylistAdapter: SynchronizerAdapter {

    /// Default playlist
    static let playlistID = "79670980"
    
    override func synchronizeData() {
        
        super.synchronizeData()
    }
    
    /// Fetches all playlists
    ///
    /// - Returns: promise with playlist array
    class func fetch()-> Promise<Playlist?> {

        /// Networking call
        
        let netman = NetworkingManager.shared
        return netman.request(.get, path: "playlists/\(playlistID)").then { response-> Promise<Playlist?> in
            
            /// Insert into db
            return CoreDataManager.insertASync(Into<Playlist>(), source: response)
        }
    }
}
