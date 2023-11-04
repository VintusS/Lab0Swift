//
//  fileReader.swift
//  Lab0 Swift
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
            print("Error reading text file: \(error)")
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
            print("Error reading Swift file: \(error)")
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
            print("Error reading Python file: \(error)")
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
            print("Error reading Java file: \(error)")
            return nil
        }
    }
}

func readFiles() -> (String, String, String, String, (String, String, String, String)) {
    let textFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.txt"
    let swiftFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.swift"
    let pythonFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.py"
    let javaFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/git_test.java"

    let textReader = TextFileReader(filePath: textFilePath)
    let swiftReader = SwiftFileReader(filePath: swiftFilePath)
    let pythonReader = PythonFileReader(filePath: pythonFilePath)
    let javaReader = JavaFileReader(filePath: javaFilePath)

    let textFileContent = textReader.readFile() ?? ""
    let swiftFileContent = swiftReader.readFile() ?? ""
    let pythonFileContent = pythonReader.readFile() ?? ""
    let javaFileContent = javaReader.readFile() ?? ""

    func getFileNames() -> (String, String, String, String) {
        let textFileName = textReader.getFileName()
        let swiftFileName = swiftReader.getFileName()
        let pythonFileName = pythonReader.getFileName()
        let javaFileName = javaReader.getFileName()

        return (textFileName, swiftFileName, pythonFileName, javaFileName)
    }

    return (textFileContent, swiftFileContent, pythonFileContent, javaFileContent, getFileNames())
}

func readSnapshotFiles() -> (String, String, String, String, (String, String, String, String)) {
    let textFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/git_test.txt"
    let swiftFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/git_test.swift"
    let pythonFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/git_test.py"
    let javaFilePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/snapshot/git_test.java"

    let textReader = TextFileReader(filePath: textFilePath)
    let swiftReader = SwiftFileReader(filePath: swiftFilePath)
    let pythonReader = PythonFileReader(filePath: pythonFilePath)
    let javaReader = JavaFileReader(filePath: javaFilePath)

    let textFileContent = textReader.readFile() ?? ""
    let swiftFileContent = swiftReader.readFile() ?? ""
    let pythonFileContent = pythonReader.readFile() ?? ""
    let javaFileContent = javaReader.readFile() ?? ""

    func getFileNames() -> (String, String, String, String) {
        let textFileName = textReader.getFileName()
        let swiftFileName = swiftReader.getFileName()
        let pythonFileName = pythonReader.getFileName()
        let javaFileName = javaReader.getFileName()

        return (textFileName, swiftFileName, pythonFileName, javaFileName)
    }

    return (textFileContent, swiftFileContent, pythonFileContent, javaFileContent, getFileNames())
}
