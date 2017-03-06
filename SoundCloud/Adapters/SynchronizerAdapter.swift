//
//  SynchronizationAdapter.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 3/5/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import Foundation

protocol SynchronizerAdapterDelegate {
    
    func adapterDidSynchronized(_ adapter: SynchronizerAdapter)
}

class SynchronizerAdapter {
    
    // MARK: - Delegates
    var delegate: SynchronizerAdapterDelegate?
    
    // MARK: - Properties
    var synchronized = false
    
    var updateNotificationKey: String?
    
    // MARK: - Initialization methods
    
    class func modelName()-> String {
        
        return ""
    }
    
    class func updatedNotificationKey()-> String {
        
        return String(format: "SynchronizerAdapterUpdateNotificationFor%@", self.modelName())
    }
    
    class func postUpdateNoticiation(_ objectID: String?) {
        
        guard let _objectID = objectID else {
            
            print("objectID in update call is nil")
            return
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: self.updatedNotificationKey()), object: nil, userInfo: ["objectID": _objectID])
    }
    
    // MARK: - Synchronization logic
    
    func synchronizeData() {
        
        self.synchronized = true
        
        if self.delegate != nil {
            self.delegate?.adapterDidSynchronized(self)
        }
    }
}
