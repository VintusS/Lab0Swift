//
//  imageChange.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation
import CryptoKit

func imageContentChanged(_ imagePath: String, _ previousHash: String? = nil) -> Bool {
    guard let imageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath)) else {
        print("Error reading image data")
        return false
    }
    
    let imageHash = SHA256.hash(data: imageData)
    let imageHashString = imageHash.compactMap { String(format: "%02x", $0) }.joined()
    
    if let previousHash = previousHash {
        return imageHashString != previousHash
    } else {
        return true
    }
}

//// Example usage:
//let imagePath = "/path/to/your/image.jpg"  // Replace with the actual image file path
//
//// Check if the image content hash changed
//let previousHash: String? = "previous_hash_value"  // Replace with the previous hash, if available
//if imageContentChanged(imagePath, previousHash) {
//    print("Image content has changed.")
//} else {
//    print("Image content has not changed.")
//}

