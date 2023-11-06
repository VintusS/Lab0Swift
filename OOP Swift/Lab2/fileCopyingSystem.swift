//
//  fileCopyingSystem.swift
//  Lab2 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

func copyFiles(from sourceFolder: String, to destinationFolder: String) {
    let fileManager = FileManager.default
    do {
        let fileURLs = try fileManager.contentsOfDirectory(at: URL(fileURLWithPath: sourceFolder), includingPropertiesForKeys: nil)

        for fileURL in fileURLs {
            let fileName = fileURL.lastPathComponent
            let sourceFilePath = fileURL.path
            let destinationFilePath = "\(destinationFolder)/\(fileName)"

            if fileManager.fileExists(atPath: destinationFilePath) {
                try fileManager.removeItem(atPath: destinationFilePath)
            }

            try fileManager.copyItem(atPath: sourceFilePath, toPath: destinationFilePath)
        }
        
        let fileNames = fileURLs.map { $0.lastPathComponent }
        let fileListContent = fileNames.joined(separator: "\n")
        let fileListPath = "\(destinationFolder)/fileList.txt"
        try fileListContent.write(toFile: fileListPath, atomically: true, encoding: .utf8)
    } catch {
        print("Error copying files: \(error.localizedDescription)")
    }
}
