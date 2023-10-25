//
//  fileCopyingSystem.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

func copyFiles(from sourceFolder: String, to destinationFolder: String) {
    let fileExtensions = ["java", "py", "swift", "txt"]
    
    for fileExtension in fileExtensions {
        let sourceFilePath = "\(sourceFolder)/git_test.\(fileExtension)"
        let destinationFilePath = "\(destinationFolder)/git_test.\(fileExtension)"
        
        let fileManager = FileManager.default
        
        do {
            if fileManager.fileExists(atPath: sourceFilePath) {
                if fileManager.fileExists(atPath: destinationFilePath) {
                    try fileManager.removeItem(atPath: destinationFilePath)
                }
                
                try fileManager.copyItem(atPath: sourceFilePath, toPath: destinationFilePath)
            } else {
                print("Source file with extension .\(fileExtension) not found.")
            }
        } catch {
            print("Error copying file with extension .\(fileExtension): \(error)")
        }
    }
}
