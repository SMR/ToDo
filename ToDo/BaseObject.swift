//
//  BaseObject.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import UIKit

class BaseObject: NSObject {
    
    let identifier: String
    
    override init() {
        self.identifier = NSUUID().UUIDString
        super.init()
    }
    
}
