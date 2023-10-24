//
//  snapshotData.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

func getCurrentTime() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormatter.string(from: Date())
}

let snapshotTimePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/snapshotCreationTime.txt"

func changeSnapshotCreationTime() {
    let currentTime = getCurrentTime()
    
    do {
        try "".write(toFile: snapshotTimePath, atomically: false, encoding: .utf8)
        let fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: snapshotTimePath))
        fileHandle.seekToEndOfFile()
        if let data = currentTime.data(using: .utf8) {
            fileHandle.write(data)
        }
        fileHandle.closeFile()
    } catch {
        print("Error updating snapshot creation time: \(error)")
    }
}
