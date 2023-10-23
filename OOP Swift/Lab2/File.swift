//
//  File.swift
//  Lab0 Swift
//
//  Created by Dragosh on 23.10.2023.
//

import Foundation
import CoreGraphics
import AppKit

class File {
    let name: String
    let path: String
    let fileExtension: String
    var isChanged: Bool

    init(name: String, path: String) {
        self.name = name
        self.path = path
        self.fileExtension = URL(fileURLWithPath: path).pathExtension
        self.isChanged = false
    }

    func info() {
        print("File: \(name)")
        print("Extension: \(fileExtension)")

        if fileExtension == "txt" {
            // Code to count lines, words, and characters in a text file
            if let contents = try? String(contentsOf: URL(fileURLWithPath: path)) {
                let lines = contents.components(separatedBy: "\n")
                let wordCount = contents.split { $0.isWhitespace || $0.isNewline }.count
                let characterCount = contents.count
                print("Line Count: \(lines.count)")
                print("Word Count: \(wordCount)")
                print("Character Count: \(characterCount)")
            }
        } else if fileExtension == "png" || fileExtension == "jpg" {
            // Code to get image size for image files
            if let image = NSImage(contentsOfFile: path) {
                if let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) {
                    let width = cgImage.width
                    let height = cgImage.height
                    print("Image Size: \(width)x\(height)")
                } else {
                    print("Error: Unable to extract image dimensions.")
                }
            } else {
                print("Error: Unable to read the image.")
            }
        } else if fileExtension == "py" || fileExtension == "java" {
            // Code to count lines, classes, and methods for program files
            if let contents = try? String(contentsOf: URL(fileURLWithPath: path)) {
                let lines = contents.components(separatedBy: "\n")
                let classCount = lines.filter { $0.contains("class ") || $0.contains("public class ") }.count
                let methodCount = lines.filter { $0.contains("func ") || $0.contains("def ") || $0.contains("public static void ") }.count
                print("Line Count: \(lines.count)")
                print("Class Count: \(classCount)")
                print("Method Count: \(methodCount)")
            }
        }
    }
}
