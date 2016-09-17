//
//  Item.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import UIKit

protocol ObjectStoreDelegate: class
{
    // Require implementation.
    
    associatedtype Object: BaseObject, NSCoding
    var objects: [Object] { set get }
    
    // Provide default implementation.
    
    func add(_ object: Object)
    func remove(_ object: Object)
    func removeAllObjects()
    
    func objectForIndexPath(_ indexPath: IndexPath) -> Object
    func count() -> Int
    
    func save(_ file: String)
}

extension ObjectStoreDelegate
{
    func add(_ object: Object)
    {
        self.objects.append(object)
    }
    
    func remove(_ item: Object)
    {
        self.objects = self.objects.filter({ (storedItem) -> Bool in
            return item.identifier != storedItem.identifier
        })
    }
    
    func removeAllObjects()
    {
        self.objects.removeAll(keepingCapacity: false)
    }
    
    func objectForIndexPath(_ indexPath: IndexPath) -> Object
    {
        return self.objects[(indexPath as NSIndexPath).row]
    }
    
    func count() -> Int
    {
        return self.objects.count
    }
    
    func save(_ file: String)
    {
        NSKeyedArchiver.archiveRootObject(self.objects, toFile: file)
    }    
}
