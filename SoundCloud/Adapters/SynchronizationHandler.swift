//
//  SynchronizationHandler.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 3/5/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import Foundation

let SynchronizerHandlerSynchronizedNotificationKey = "SynchronizerHandlerSynchronizedNotificationKey"

class TMSynchronizerHandler: SynchronizerAdapterDelegate {
    
    static let sharedSynchronizer = TMSynchronizerHandler()
    
    // MARK: - Properties
    
    var showProgress = false
    
    var dataAdaptersArray: [SynchronizerAdapter]?
    
    var synchronized: Bool = false
    
    // MARK: - Synchronization logic
    // synchronizing all adapters
    func resynchronize() {
        
        self.synchronized = false
        
        guard let _dataAdaptersArray = self.dataAdaptersArray else {
            
            return
        }
        
        if _dataAdaptersArray.count > 0 {
            for adapter in _dataAdaptersArray {
                
                adapter.synchronizeData()
            }
        }
    }
    
    func addAdapter(_ adapter: SynchronizerAdapter) {
        
        if self.dataAdaptersArray != nil {
            
            adapter.delegate = self
            self.dataAdaptersArray!.append(adapter)
        }
    }
    
    func adapterDidSynchronized(_ adapter: SynchronizerAdapter) {
        
        guard let _dataAdaptersArray = self.dataAdaptersArray else {
            
            return
        }
        
        var synchronized = true
        
        if _dataAdaptersArray.count > 0 {
            
            for adapter in _dataAdaptersArray {
                if !adapter.synchronized {
                    synchronized = false
                }
                
                print("--------------------")
                print(adapter, adapter.synchronized)
            }
        }
        
        self.synchronized = synchronized
        
        if self.synchronized {
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: SynchronizerHandlerSynchronizedNotificationKey), object: nil)
        }
    }
}
