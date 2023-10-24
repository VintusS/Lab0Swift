//
//  mockFunctions.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

func getFileCreationDate(filePath: String) -> Date? {
    do {
        let attributes = try FileManager.default.attributesOfItem(atPath: filePath)
        return attributes[.creationDate] as? Date
    } catch {
        print("Error getting creation date: \(error)")
        return nil
    }
}

func getFileModificationDate(filePath: String) -> Date? {
    do {
        let attributes = try FileManager.default.attributesOfItem(atPath: filePath)
        return attributes[.modificationDate] as? Date
    } catch {
        print("Error getting modification date: \(error)")
        return nil
    }
}
