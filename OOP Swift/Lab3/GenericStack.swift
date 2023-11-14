//
//  GenericStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func genericStack() {
    var genericStack = ArrayStack<Any>(capacity: 5)

    while true {
        print("Enter your command: (push, pop, print or exit):")
        if let action = readLine() {
            switch action {
            case "push":
                print("Enter something to push:")
                if let value = readLine() {
                    genericStack.push(value)
                    print("Pushed '\(value)'")
                }
            case "pop":
                if let popped = genericStack.pop() {
                    print("Popped: \(popped)")
                } else {
                    print("Stack is empty.")
                }
            case "print":
                print("Stack elements: \(genericStack.elements())")
            case "exit":
                print("Exiting...")
                interface()
            default:
                print("Invalid command.")
            }
        }
    }
}
