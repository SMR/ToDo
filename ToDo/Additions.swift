//
//  Additions.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

extension String
{
    static func archivePath() -> String
    {
        return URL.archiveURL().path
    }
    
}

extension URL
{
    static func documentsDirectory() -> URL
    {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError("Error getting Documents directory. Error origin: \(#function)") }
        return documentsDirectory
    }
    
    static func archiveURL(_ storeId: String = "archive") -> URL
    {
        return self.documentsDirectory().appendingPathComponent(storeId)
    }
    
}
