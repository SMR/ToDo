//
//  Item.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

class Item: BaseObject, NSCoding
{
    var itemDescription: String
    var itemDate: Date
    
    init(description: String, date: Date = Date())
    {
        self.itemDescription = description
        self.itemDate = date
    }
    
    // MARK: NSCoding
    
    @objc required convenience init?(coder aDecoder: NSCoder)
    {
        guard let description = aDecoder.decodeObject(forKey: "itemDescription") as? String else { fatalError("No description.") }
        guard let date = aDecoder.decodeObject(forKey: "itemDate") as? Date else { fatalError("No date.") }

        // After we get all of our data, let's initialize the actual object.
        self.init(description: description, date: date)
    }
    
    @objc func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.itemDescription, forKey: "itemDescription")
        aCoder.encode(self.itemDate, forKey: "itemDate")
    }
}
