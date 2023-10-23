//
//  Snapshot.swift
//  Lab0 Swift
//
//  Created by Dragosh on 23.10.2023.
//

import Foundation

class Snapshot {
    let timestamp: Date
    var files: [File]

    init() {
        self.timestamp = Date()
        self.files = []
    }

    func commit() {
        // Update the snapshot time and reset file statuses
        let newTimestamp = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS"
        let formattedTimestamp = timeFormatter.string(from: newTimestamp)
        
        print("Created Snapshot at : \(formattedTimestamp)")
        
        // Iterate through the files and reset their statuses
        for file in files {
            file.isChanged = false
        }
    }

    func status() {
        // Iterate through files and print their statuses
        print("Status:")
        for file in files {
            if file.isChanged {
                print("\(file.name) - Changed")
            } else {
                print("\(file.name) - No Change")
            }
        }
    }
}
