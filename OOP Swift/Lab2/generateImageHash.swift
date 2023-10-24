//
//  generateImageHash.swift
//  Lab0 Swift
//
//  Created by Dragosh on 24.10.2023.
//

import Foundation
import CryptoKit

func generateImageHash(_ imagePath: String) -> String? {
    guard let imageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath)) else {
        print("Error reading image data")
        return nil
    }
    
    let imageHash = SHA256.hash(data: imageData)
    let imageHashString = imageHash.compactMap { String(format: "%02x", $0) }.joined()
    
    return imageHashString
}
