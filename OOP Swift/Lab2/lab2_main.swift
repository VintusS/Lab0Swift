//
//  lab2_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 16.10.2023.
//

import Foundation

func lab2() {
    let folderPath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit"
    let contents = readFilesInFolder(atPath: folderPath)
    for (fileName, fileContent) in contents {
        print("File: \(fileName)")
    }
    
    // Example usage:
    let imagePath = "/Users/vintuss/Documents/sum shit/Swift/UTM OOP/sum shit/image.jpg"

    // Check if the image content hash changed
    let previousHash: String? =  generateImageHash(imagePath) // Replace with the previous hash, if available
    if imageContentChanged(imagePath, previousHash) {
        print("Image content has changed.")
    } else {
        print("Image content has not changed.")
    }
}
