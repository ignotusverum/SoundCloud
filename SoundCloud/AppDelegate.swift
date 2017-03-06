//
//  AppDelegate.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 2/20/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        setupAdapters()
    }
    
    /// Setup Adapters
    private func setupAdapters() {
        
        /// Shared synchronizer
        let synchronizer = SynchronizerHandler.shared
        
        /// Create synchronizers
        let playlistAdapter = PlaylistAdapter()
        synchronizer.addAdapter(playlistAdapter)
        
        /// Synrchronize
        synchronizer.resynchronize()
    }
}

