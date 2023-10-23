//
//  Folder.swift
//  Lab0 Swift
//
//  Created by Dragosh on 23.10.2023.
//

import Foundation

class Folder {
    let path: String
    var files: [File]

    init(path: String) {
        self.path = path
        self.files = []
        self.files = scanFolderForFiles()
    }

    private func scanFolderForFiles() -> [File] {
        do {
            let fileManager = FileManager.default
            let folderURL = URL(fileURLWithPath: path)
            let contents = try fileManager.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil)
            
            return contents.compactMap { url in
                if let name = url.lastPathComponent.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
                    return File(name: name, path: url.path)
                }
                return nil
            }
        } catch {
            print("Error scanning folder for files: \(error)")
            return []
        }
    }
}
