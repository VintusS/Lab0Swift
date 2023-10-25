//
//  lab2_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 16.10.2023.
//

import Foundation

func lab2() {

    var flag0 = true
    let imagePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/image.jpg"
    let snapshotTimePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/snapshotCreationTime.txt"
    var (textContent, swiftContent, pythonContent, javaContent, fileNames) = readFiles()
    guard let imageContent = generateImageHash(imagePath) else { return }
    var (textFileName, swiftFileName, pythonFileName, javaFileName) = fileNames
    let sourceFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit"
    let destinationFolder = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot"
    let snapshotImagePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/snapshotimagehash.txt"
    let imageName = imageNameReturn()
    
    let textFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.txt"
    let swiftFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.swift"
    let javaFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.java"
    let pythonFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.py"
    
    while flag0 {
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
                    case "vin":
                        if filename == "commit" {
                            copyFiles(from: sourceFolder, to: destinationFolder)
                            changeSnapshotCreationTime()
                            (textContent, swiftContent, pythonContent, javaContent, fileNames) = readFiles()
                            copyHashToTextFile(imageContent, filePath: snapshotImagePath)
                            print("Commited")
                            print()
                        } else if filename == "info" {
                            print("Enter file name: ")
                            if let fileName = readLine() {
                                print("File name: \(fileName)")
                                let fileExtention = fileName.components(separatedBy: ".").last ?? ""
                                print("File extention: \(String(describing: fileExtention))")
                                let creationTime = getFileCreationDate(filePath: textFilePath)
                                print("Created: \(creationTime)")
                                let modificationTime = getFileModificationDate(filePath: textFilePath)
                                print("Modified: \(modificationTime)")
                                switch fileName {
                                case "git_test.txt":
                                    let fileData = textFileData(in: textContent)
                                    print("Lines: \(fileData.lines)")
                                    print("Words: \(fileData.words)")
                                    print("Characters: \(fileData.characters)")
                                    print()
                                case "git_test.swift":
                                    let swiftFileData = codeFilesOOPCounter(in: swiftFilePath, fileType: .swift)
                                    print("Line count: \(swiftFileData.lines)")
                                    print("Class count: \(swiftFileData.classes)")
                                    print("Method count: \(swiftFileData.methods)")
                                case "git_test.java":
                                    let javaFileData = codeFilesOOPCounter(in: javaFilePath, fileType: .java)
                                    print("Line count: \(javaFileData.lines)")
                                    print("Class count: \(javaFileData.classes)")
                                    print("Method count: \(javaFileData.methods)")
                                case "git_test.py":
                                    let pythonFileData = codeFilesOOPCounter(in: pythonFilePath, fileType: .python)
                                    print("Line count: \(pythonFileData.lines)")
                                    print("Class count: \(pythonFileData.classes)")
                                    print("Method count: \(pythonFileData.methods)")
                                    
                                case "image.jpg":
                                    guard let imageSize = getImageSize(imagePath: imagePath) else { return }
                                    let (width, height) = imageSize
                                    print("Image size: \(width)x\(height)")
                                default:
                                    print("No such file :(")
                                    print()
                                }
                                print()
                            }
                        }else if filename == "status" {
                            let (currentTextContent, currentSwiftContent, currentPythonContent, currentJavaContent, _) = readFiles()
                            let (snapshotTextContent, snapshotSwiftContent, snapshotPythonContent, snapshotJavaContent, _) = readSnapshotFiles()
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
                        } else if filename == "exit" {
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
