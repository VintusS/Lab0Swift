//
//  fileReader.swift
//  Lab2 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation

class FileReader {
    let filePath: String

    init(filePath: String) {
        self.filePath = filePath
    }
    func readFile() -> String? {
        return nil
    }

    func getFileName() -> String {
        return (filePath as NSString).lastPathComponent
    }
}

class TextFileReader: FileReader {
    override func readFile() -> String? {
        do {
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
            return fileContents
        } catch {
            return nil
        }
    }
}

class SwiftFileReader: FileReader {
    override func readFile() -> String? {
        do {
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
            return fileContents
        } catch {
            return nil
        }
    }
}

class PythonFileReader: FileReader {
    override func readFile() -> String? {
        do {
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
            return fileContents
        } catch {
            return nil
        }
    }
}

class JavaFileReader: FileReader {
    override func readFile() -> String? {
        do {
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
            return fileContents
        } catch {
            return nil
        }
    }
}
