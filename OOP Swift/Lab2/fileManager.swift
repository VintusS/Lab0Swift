//
//  fileManager.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

class File {
    let fileName: String
    let fileExtension: String
    let createdDate: Date
    var updatedDate: Date

    init(fileName: String, fileExtension: String) {
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.createdDate = Date()
        self.updatedDate = self.createdDate
    }
}


class ImageFile: File {
    let size: CGSize

    init(fileName: String, fileExtension: String, size: CGSize) {
        self.size = size
        super.init(fileName: fileName, fileExtension: fileExtension)
    }
}

class TextFile: File {
    let lineCount: Int
    let wordCount: Int
    let charCount: Int

    init(fileName: String, fileExtension: String, lineCount: Int, wordCount: Int, charCount: Int) {
        self.lineCount = lineCount
        self.wordCount = wordCount
        self.charCount = charCount
        super.init(fileName: fileName, fileExtension: fileExtension)
    }
}

class ProgramFile: File {
    let lineCount: Int
    let classCount: Int
    let methodCount: Int

    init(fileName: String, fileExtension: String, lineCount: Int, classCount: Int, methodCount: Int) {
        self.lineCount = lineCount
        self.classCount = classCount
        self.methodCount = methodCount
        super.init(fileName: fileName, fileExtension: fileExtension)
    }
}

enum FileExtension: String {
    case swift = "swift"
    case java = "java"
    case python = "py"
    case text = "txt"
}
