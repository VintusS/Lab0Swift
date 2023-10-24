//
//  fileReader.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

func readFilesInFolder(atPath folderPath: String) -> [String: String] {
    var fileContents = [String: String]()
    
    let fileManager = FileManager.default
    do {
        let fileURLs = try fileManager.contentsOfDirectory(atPath: folderPath)
        
        for fileURL in fileURLs {
            let fileContentsURL = URL(fileURLWithPath: folderPath).appendingPathComponent(fileURL)
            if let data = try? Data(contentsOf: fileContentsURL),
               let content = String(data: data, encoding: .utf8) {
                fileContents[fileURL] = content
            }
        }
    } catch {
        print("Error reading files in folder: \(error.localizedDescription)")
    }
    
    return fileContents
}
