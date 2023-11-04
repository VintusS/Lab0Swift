//
//  folderContinuousChecking.swift
//  Lab0 Swift
//
//  Created by Dragosh on 04.11.2023.
//

import Foundation

let sourceFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit"


func monitorChanges(in sourceFolder: String) {
    let fileManager = FileManager.default
    var lastKnownFileStates = [String: String]() // Dictionary to hold file names and their hash

    // Initial fill of the dictionary
    for fileName in getFileNames(in: sourceFolder) {
        if let fileHash = generateImageHash("\(sourceFolder)/\(fileName)") {
            lastKnownFileStates[fileName] = fileHash
        }
    }

    // Start the monitoring loop
    while true {
        sleep(5) // Wait for 5 seconds
        var currentFileStates = [String: String]()
        
        let currentFileNames = Set(getFileNames(in: sourceFolder))
        
        // Generate hashes for current files
        for fileName in currentFileNames {
            if let fileHash = generateImageHash("\(sourceFolder)/\(fileName)") {
                currentFileStates[fileName] = fileHash
            }
        }
        
        // Check for changes
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
        
        // Check for deletions
        for fileName in lastKnownFileStates.keys {
            if !currentFileStates.keys.contains(fileName) {
                print()
                print("\(fileName) - Deleted")
                print("your input>", terminator: " ")
            }
        }
        
        // Update the last known states to the current states
        lastKnownFileStates = currentFileStates
    }
}
