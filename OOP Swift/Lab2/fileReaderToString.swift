//
//  fileReaderToString.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

func readTextFileToString(filePath: String) -> String? {
    do {
        let text = try String(contentsOfFile: filePath, encoding: .utf8)
        return text
    } catch {
        print("Error reading file: \(error.localizedDescription)")
        return nil
    }
}
