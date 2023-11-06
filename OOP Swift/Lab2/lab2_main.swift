//
//  lab2_main.swift
//  Lab2 Swift
//
//  Created by Dragosh on 16.10.2023.
//

import Foundation

// MARK: Main function for Laboratory work nr.2
func lab2() {

    // MARK: Paths
    var flag0 = true
    let imagePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/image.jpg"
    let snapshotTimePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/snapshotCreationTime.txt"
    var (textContent, swiftContent, pythonContent, javaContent, fileNames) = readFiles()
    guard let imageContent = generateImageHash(imagePath) else { return }
    let sourceFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit"
    let destinationFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot"
    let snapshotImagePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/snapshotimagehash.txt"
    let imageName = imageNameReturn()
    
    let textFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.txt"
    let swiftFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.swift"
    let javaFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.java"
    let pythonFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.py"
    
    DispatchQueue.global(qos: .background).async {
        monitorChanges(in: sourceFolder)
    }
    
    while flag0 {
        // MARK: Vin Main Menu
            print("Welcome to my GitHub-like program")
            print("Designed by VintusS")
            print("Enter your command: vin+(commit, info <filename>, status, exit):")
            print("your input>", terminator: " ")
            if let yourInput = readLine() {
                let inputComponents = yourInput.split(separator: " ")
                if inputComponents.count >= 2 {
                    let command = String(inputComponents[0])
                    let filename = String(inputComponents[1])
                    switch command {
                        // MARK: vin commit
                    case "vin":
                        if filename == "commit" {
                            copyFiles(from: sourceFolder, to: destinationFolder)
                            changeSnapshotCreationTime()
                            (textContent, swiftContent, pythonContent, javaContent, fileNames) = readFiles()
                            copyHashToTextFile(imageContent, filePath: snapshotImagePath)
                            print("Commited")
                            print()
                            // MARK: vin info
                        } else if filename == "info" {
                            print("Enter file name: ")
                            if let fileName = readLine() {
                                print("File name: \(fileName)")
                                let fileExtension = fileName.components(separatedBy: ".").last ?? ""
                                print("File extension: \(fileExtension)")
                                let filePath = "\(sourceFolder)/\(fileName)"
                                let creationTime = getFileCreationDate(filePath: filePath)
                                let modificationTime = getFileModificationDate(filePath: filePath)
                                print("Created: \(creationTime)")
                                print("Modified: \(modificationTime)")
                                if let fileType = FileExtension(rawValue: fileExtension) {
                                    switch fileType {
                                    case .text:
                                        if let fileData = try? String(contentsOfFile: filePath, encoding: .utf8) {
                                            let textData = textFileData(in: fileData)
                                            print("Lines: \(textData.lines)")
                                            print("Words: \(textData.words)")
                                            print("Characters: \(textData.characters)")
                                        }
                                    case .swift, .java, .python:
                                        let codeData = codeFilesOOPCounter(in: filePath, fileType: fileType)
                                        print("Line count: \(codeData.lines)")
                                        print("Class count: \(codeData.classes)")
                                        print("Method count: \(codeData.methods)")
                                    }
                                } else if fileExtension == "jpg" {
                                    if let imageSize = getImageSize(imagePath: filePath) {
                                        let (width, height) = imageSize
                                        print("Image size: \(width)x\(height)")
                                    } else {
                                        print("Could not determine image size.")
                                    }
                                } else {
                                    print("No handler for file extension: \(fileExtension)")
                                }
                            }
                            print()
                        } else if filename == "status" {
                            let currentFileNames = Set(getFileNames(in: sourceFolder))
                            var snapshotFileNames = Set<String>()
                            
                            do {
                                let snapshotFileNamesString = try String(contentsOfFile: "\(destinationFolder)/fileList.txt", encoding: .utf8)
                                snapshotFileNames = Set(snapshotFileNamesString.split(separator: "\n").map(String.init))
                            } catch {
                                print("Error reading the snapshot file list: \(error.localizedDescription)")
                            }
                            
                            guard let snapshotCreationTime = readTextFileToString(filePath: snapshotTimePath) else { return }
                            print("Created Snapshot at: " + snapshotCreationTime)
                            
                            let newFiles = currentFileNames.subtracting(snapshotFileNames)
                            let deletedFiles = snapshotFileNames.subtracting(currentFileNames)
                            
                            for file in newFiles {
                                print("\(file) - New File")
                            }
                            
                            for file in deletedFiles {
                                print("\(file) - Deleted")
                            }
                            
                            for file in currentFileNames.intersection(snapshotFileNames) {
                                let currentFilePath = "\(sourceFolder)/\(file)"
                                let snapshotFilePath = "\(destinationFolder)/\(file)"
                                let currentFileHash = generateImageHash(currentFilePath) ?? ""
                                let snapshotFileHash = generateImageHash(snapshotFilePath) ?? ""
                                
                                if currentFileHash != snapshotFileHash {
                                    print("\(file) - Changed")
                                } else {
                                    print("\(file) - No Change")
                                }
                            }
                            
                            print()
                        }
                        // MARK: vin exit
                        else if filename == "exit" {
                            flag0 = false
                            exit(0)
                        } else {
                            print("Command not found :(")
                        }
                    default:
                        print("Invalid command. Please use 'vin commit', 'vin info <filename>', 'vin status', or 'vin exit'.")
                    }
                }
            }
        }
}
