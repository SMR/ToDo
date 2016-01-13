//
//  Item.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import UIKit

protocol ObjectStoreDelegate: class {
    
    // Require implementation.
    
    typealias Object: BaseObject, NSCoding
    var objects: [Object] { set get }
    
    // Provide default implementation.
    
    func add(object: Object)
    func remove(object: Object)
    func removeAllObjects()
    
    func objectForIndexPath(indexPath: NSIndexPath) -> Object
    func count() -> Int
    
    func save(file: String)
    
}

extension ObjectStoreDelegate {
    
    func add(object: Object) {
        self.objects.append(object)
    }
    
    func remove(item: Object) {
        self.objects = self.objects.filter({ (storedItem) -> Bool in
            return item.identifier != storedItem.identifier
        })
    }
    
    func removeAllObjects() {
        self.objects.removeAll(keepCapacity: false)
    }
    
    func objectForIndexPath(indexPath: NSIndexPath) -> Object {
        return self.objects[indexPath.row]
    }
    
    func count() -> Int {
        return self.objects.count
    }
    
    func save(file: String) {
        NSKeyedArchiver.archiveRootObject(self.objects, toFile: file)
    }
    
}