//
//  ItemStore.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

class Store: ObjectStoreDelegate {
    
    static let shared = Store()
    
    private init() {
        if let
            data = NSData(contentsOfURL: NSURL.archiveURL()),
            storedItems = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Item] {
            self.objects = storedItems
        }
    }
    
    // MARK: ObjectStore
    
    // 1. Simply specify what Object is.
    typealias Object = Item
    
    // 2. Create store array.
    var objects = [Object]()
    
}