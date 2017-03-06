//
//  Model.swift
//  consumer
//
//  Created by Vladislav Zagorodnyuk on 2/3/16.
//  Copyright © 2016 Human Ventures Co. All rights reserved.
//

import SwiftyJSON
import PromiseKit
import CoreStore

struct ModelJSON {
    
    static let id = "id"
}

@objc(Model)
open class Model: _Model {

    var json: JSON?
    
    // MARK: - Importable Source Protocol
    public typealias ImportSource = JSON
    
    // Unique ID key
    public static var uniqueIDKeyPath: String {
        return "id"
    }
    
    // Unique ID Type
    public typealias UniqueIDType = Int
    
    public var uniqueIDValue: Int {
        get { return id.intValue }
        set { id = NSNumber(value: newValue) }
    }
    
    // Unique ID value
    public static func shouldInsert(from source: JSON, in transaction: BaseDataTransaction) -> Bool {
        
        if let id = source["id"].int {
            
            let object = transaction.fetchOne(From<Model>(),
                                              Where("\(ModelJSON.id) == %@", id))
            
            if object != nil {
                
                return false
            }
        }
        
        return true
    }
    
    // Update object with importable source
    public static func shouldUpdate(from source: JSON, in transaction: BaseDataTransaction) -> Bool {
        
        return true
    }
    
    public static func uniqueID(from source: JSON, in transaction: BaseDataTransaction) throws -> Int? {
        
        return source["id"].int
    }
    
    public func update(from source: JSON, in transaction: BaseDataTransaction) throws {
        
        try self.updateModel(with: source, transaction: transaction)
    }
    
    // New object created
    public func didInsert(from source: JSON, in transaction: BaseDataTransaction) throws {
        
        try self.updateModel(with: source, transaction: transaction)
    }
    
    public func updateFromImportSource(_ source: JSON, inTransaction transaction: BaseDataTransaction) throws {
        
        try self.updateModel(with: source, transaction: transaction)
    }
    
    func updateModel(with source: JSON, transaction: BaseDataTransaction) throws { }
}
