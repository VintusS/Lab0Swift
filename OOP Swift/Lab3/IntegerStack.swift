//
//  IntegerStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func integerStack() {
    var intStack = ArrayStack<Int>(capacity: 5)
    
    while true {
        print("Enter 'push', 'pop', or 'exit':")
        if let action = readLine() {
            switch action {
            case "push":
                print("Enter an integer to push:")
                if let value = readLine(), let intValue = Int(value) {
                    intStack.push(intValue)
                    print("Pushed \(intValue)")
                } else {
                    print("Invalid integer.")
                }
            case "pop":
                if let popped = intStack.pop() {
                    print("Popped: \(popped)")
                } else {
                    print("Stack is empty.")
                }
            case "print":
                print("Stack elements: \(intStack.elements())")
            case "exit":
                print("Exiting...")
                break
            default:
                print("Invalid command.")
            }
        }
    }
}
