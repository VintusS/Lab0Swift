//
//  lab2_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 16.10.2023.
//

import Foundation

func lab2() {
    let folderPath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/OOP Swift/Lab2" // Update the folder path
    let snapshot = Snapshot()
    let folder = Folder(path: folderPath)
    
    while true {
        print("Enter a command (commit, info <filename>, status, or exit):")
        if let input = readLine() {
            let parts = input.components(separatedBy: " ")
            let command = parts[0]
            switch command {
            case "commit":
                snapshot.commit()
            case "info":
                if parts.count == 2 {
                    let filename = parts[1]
                    // Find the corresponding file in the 'files' array
                    if let file = folder.files.first(where: { $0.name == filename }) {
                        file.info()
                    } else {
                        print("File not found.")
                    }
                } else {
                    print("Invalid 'info' command. Usage: info <filename>")
                }
            case "status":
                snapshot.status()
            case "exit":
                exit(0)
            default:
                print("Invalid command. Available commands: commit, info, status, exit")
            }
        }
    }
}
