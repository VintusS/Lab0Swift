//
//  lab2_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 16.10.2023.
//

import Foundation

var flag0 = true

func lab2() {

    let imagePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/image.jpg"
    let snapshotTimePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/snapshotCreationTime.txt"
    var (textContent, swiftContent, pythonContent, javaContent, fileNames) = readFiles()
    guard let imageContent = generateImageHash(imagePath) else { return }
    var (textFileName, swiftFileName, pythonFileName, javaFileName) = fileNames
    let (snapshotTextContent, snapshotSwiftContent, snapshotPythonContent, snapshotJavaContent, snapshotFileNames) = readSnapshotFiles()
    let currentTime = getCurrentTime()
    let sourceFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit"
    let destinationFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot"
    let snapshotImagePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/snapshotimagehash.txt"
    let imageName = imageNameReturn()
    
    
    while flag0 {
        print("Welcome to my GitHub-like program")
        print("Designed by VintusS")
        print("Enter your command: vin + (commit, info<filename>, status, exit):")
        print("your input>", terminator: " ")
        if let yourInput = readLine() {
            switch yourInput {
            case "vin commit":
                copyFiles(from: sourceFolder, to: destinationFolder)
                changeSnapshotCreationTime()
                (textContent, swiftContent, pythonContent, javaContent, fileNames) = readFiles()
                copyHashToTextFile(imageContent, filePath: snapshotImagePath)
                print("Commited")
                print()
            case "vin info":
                print("info")
            case "vin status":
                let (currentTextContent, currentSwiftContent, currentPythonContent, currentJavaContent, _) = readFiles()
                let (snapshotTextContent, snapshotSwiftContent, snapshotPythonContent, snapshotJavaContent, _) = readSnapshotFiles()
                let currentImageContent = generateImageHash(imagePath)
                let snapshotImageHash = readTextFileToString(filePath: snapshotImagePath)
                guard let snapshotCreationTime = readTextFileToString(filePath: snapshotTimePath) else { return }
                print("Created Snapshot: " + snapshotCreationTime)
                if currentTextContent == snapshotTextContent {
                    print(textFileName + ":" + " Not changed")
                } else {
                    print(textFileName + ":" + " Changed")
                }
                if currentSwiftContent == snapshotSwiftContent {
                    print(swiftFileName + ":" + " Not changed")
                } else {
                    print(swiftFileName + ":" + " Changed")
                }
                if currentPythonContent == snapshotPythonContent {
                    print(pythonFileName + ":" + " Not changed")
                } else {
                    print(pythonFileName + ":" + " Changed")
                }
                if currentJavaContent == snapshotJavaContent {
                    print(javaFileName + ":" + " Not changed")
                } else {
                    print(javaFileName + ":" + " Changed")
                }
                if snapshotImageHash == imageContent {
                    print(imageName + ": Not changed")
                    print()
                } else {
                    print(imageName + ": Changed")
                    print()
                }
            case "vin exit":
                flag0 = false
                exit(0)
            default:
                print("Command not found :(")
                print()
            }
        }
    }
}
