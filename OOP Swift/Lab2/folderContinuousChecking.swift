//
//  folderContinuousChecking.swift
//  Lab0 Swift
//
//  Created by Dragosh on 04.11.2023.
//

import Foundation

let sourceFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit"

// MARK: Status check every 5 sec
func monitorChanges(in sourceFolder: String) {
    let fileManager = FileManager.default
    var lastKnownFileStates = [String: String]()

    for fileName in getFileNames(in: sourceFolder) {
        if let fileHash = generateImageHash("\(sourceFolder)/\(fileName)") {
            lastKnownFileStates[fileName] = fileHash
        }
    }

    while true {
        sleep(5)
        var currentFileStates = [String: String]()
        
        let currentFileNames = Set(getFileNames(in: sourceFolder))
        
        for fileName in currentFileNames {
            if let fileHash = generateImageHash("\(sourceFolder)/\(fileName)") {
                currentFileStates[fileName] = fileHash
            }
        }
        
        for (fileName, fileHash) in currentFileStates {
            if let lastHash = lastKnownFileStates[fileName] {
                if lastHash != fileHash {
                    print()
                    print("\(fileName) - Changed")
                    print("your input>", terminator: " ")
                }
            } else {
                print()
                print("\(fileName) - New File")
                print("your input>", terminator: " ")
            }
        }
        
        for fileName in lastKnownFileStates.keys {
            if !currentFileStates.keys.contains(fileName) {
                print()
                print("\(fileName) - Deleted")
                print("your input>", terminator: " ")
            }
        }
        lastKnownFileStates = currentFileStates
    }
}
