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

func copyHashToTextFile(_ content: String, filePath: String) {
    do {
        try "".write(toFile: filePath, atomically: false, encoding: .utf8)
        
        if let data = content.data(using: .utf8) {
            let fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: filePath))
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
            fileHandle.closeFile()
        }
    } catch {
        print("Error copying string to \(filePath): \(error)")
    }
}

func imageNameReturn() -> String{
    let filePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/image.jpg"
    var fileName = ""
    if let url = URL(string: filePath) {
        fileName = url.lastPathComponent
    }
    return fileName
}
