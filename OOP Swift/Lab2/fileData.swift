//
//  mockFunctions.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation
import CoreGraphics

// MARK: Creation Date
func getFileCreationDate(filePath: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    do {
        let attributes = try FileManager.default.attributesOfItem(atPath: filePath)
        if let creationDate = attributes[.creationDate] as? Date {
            return dateFormatter.string(from: creationDate)
        }
    } catch {
        print("Error getting creation date: \(error)")
    }
    
    return dateFormatter.string(from: Date())
}

// MARK: Modification Date
func getFileModificationDate(filePath: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    do {
        let attributes = try FileManager.default.attributesOfItem(atPath: filePath)
        if let modificationDate = attributes[.modificationDate] as? Date {
            return dateFormatter.string(from: modificationDate)
        }
    } catch {
        print("Error getting modification date: \(error)")
    }
    return dateFormatter.string(from: Date())
}

func getImageSize(imagePath: String) -> (Int, Int)? {
    guard let imageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath)) else {
        return nil
    }
    
    let sofMarker: [UInt8] = [0xFF, 0xC0]
    if let range = imageData.range(of: Data(sofMarker)) {
        let dataChunk = imageData.subdata(in: range.lowerBound..<range.lowerBound + 9)
        let height = (Int(dataChunk[5]) << 8) + Int(dataChunk[6])
        let width = (Int(dataChunk[7]) << 8) + Int(dataChunk[8])
        return (width, height)
    }
    
    return nil
}

func textFileData(in text: String) -> (lines: Int, words: Int, characters: Int) {
    let lines = text.components(separatedBy: "\n")
    
    var lineCount = 0
    var wordCount = 0
    var characterCount = 0
    
    for line in lines {
        if !line.isEmpty {
            lineCount += 1
            
            let words = line.components(separatedBy: .whitespaces)
            wordCount += words.count
            
            characterCount += line.count
        }
    }
    
    return (lineCount, wordCount, characterCount)
}

func codeFilesOOPCounter(in filePath: String, fileType: FileExtension) -> (lines: Int, classes: Int, methods: Int) {
    do {
        let content = try String(contentsOfFile: filePath)
        
        let lines = content.components(separatedBy: .newlines)
        var lineCount = 0
        
        var classCount = 0
        var methodCount = 0
        
        for line in lines {
            lineCount += 1
            
            if fileType == .swift {
                if line.contains("class ") || line.contains("struct ") || line.contains("enum ") {
                    classCount += 1
                }
                
                if line.contains("func ") {
                    methodCount += 1
                }
            } else if fileType == .java {
                if line.contains("class ") || line.contains("interface ") {
                    classCount += 1
                }
                
                if line.contains("void ") {
                    methodCount += 1
                }
            } else if fileType == .python {
                if line.contains("class ") {
                    classCount += 1
                }
                
                if line.contains("def ") {
                    methodCount += 1
                }
            }
        }
        
        return (lineCount, classCount, methodCount)
    } catch {
        print("Error reading the file: \(error)")
        return (0, 0, 0)
    }
}
