//
//  Item.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

class Item: BaseObject, NSCoding {
    
    var itemDescription: String
    var itemDate: NSDate
    
    init(description: String, date: NSDate = NSDate()) {
        self.itemDescription = description
        self.itemDate = date
    }
    
    // MARK: NSCoding
    
    @objc required convenience init?(coder aDecoder: NSCoder) {
        guard let description = aDecoder.decodeObjectForKey("itemDescription") as? String else { fatalError("No description.") }
        guard let date = aDecoder.decodeObjectForKey("itemDate") as? NSDate else { fatalError("No date.") }

        // After we get all of our data, let's initialize the actual object.
        self.init(description: description, date: date)
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.itemDescription, forKey: "itemDescription")
        aCoder.encodeObject(self.itemDate, forKey: "itemDate")
    }
    
}
