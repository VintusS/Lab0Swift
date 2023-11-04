//
//  fileCopyingSystem.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

func copyFiles(from sourceFolder: String, to destinationFolder: String) {
    let fileManager = FileManager.default
    do {
        // Get file URLs for all files in the source folder
        let fileURLs = try fileManager.contentsOfDirectory(at: URL(fileURLWithPath: sourceFolder), includingPropertiesForKeys: nil)

        // Copy each file to the destination folder
        for fileURL in fileURLs {
            let fileName = fileURL.lastPathComponent
            let sourceFilePath = fileURL.path
            let destinationFilePath = "\(destinationFolder)/\(fileName)"

            // Remove the item if it already exists at the destination
            if fileManager.fileExists(atPath: destinationFilePath) {
                try fileManager.removeItem(atPath: destinationFilePath)
            }

            // Copy the item from source to destination
            try fileManager.copyItem(atPath: sourceFilePath, toPath: destinationFilePath)
        }
        
        // After copying files, save the current file names to fileList.txt in the destination folder
        let fileNames = fileURLs.map { $0.lastPathComponent }
        let fileListContent = fileNames.joined(separator: "\n")
        let fileListPath = "\(destinationFolder)/fileList.txt"
        try fileListContent.write(toFile: fileListPath, atomically: true, encoding: .utf8)
    } catch {
        print("Error copying files: \(error.localizedDescription)")
    }
}
