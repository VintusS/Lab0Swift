//
//  StringStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func stringStack() {
    var stringStack = ArrayStack<String>(capacity: 5)
    
    while true {
        print("Enter 'push', 'pop', or 'exit':")
        if let action = readLine() {
            switch action {
            case "push":
                print("Enter a string to push:")
                if let value = readLine() {
                    stringStack.push(value)
                    print("Pushed '\(value)'")
                }
            case "pop":
                if let popped = stringStack.pop() {
                    print("Popped: \(popped)")
                } else {
                    print("Stack is empty.")
                }
            case "print":
                print("Stack elements: \(stringStack.elements())")
            case "exit":
                print("Exiting...")
                break
            default:
                print("Invalid command.")
            }
        }
    }
}
