//
//  GenericStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func genericStack() {
    let genericStack = ArrayStack<Any>(capacity: 5)

    while true {
        print("Enter your command:")
        print("1.push")
        print("2.pop")
        print("3.peek")
        print("4.isEmpty?")
        print("5.isFull?")
        print("6.size")
        print("7.print")
        print()
        print("0.Exit")
        print("-.Back")
        print()
        print("your input> ", terminator: "")
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter something to push:")
                if let value = readLine() {
                    genericStack.push(value)
                    print("Pushed '\(value)'")
                }
            case "2":
                if let popped = genericStack.pop() {
                    print("Popped: \(popped)")
                } else {
                    print("Stack is empty.")
                }
            case "3":
                if let topElement = genericStack.peek() {
                    print("Top element: \(topElement)")
                } else {
                    print("Stack is empty.")
                }
            case "4":
                print("Stack is empty: \(genericStack.isEmpty())")
            case "5":
                print("Stack is full: \(genericStack.isFull())")
            case "6":
                print("Stack size: \(genericStack.size())")
            case "7":
                print("Stack elements: \(genericStack.elements())")
            case "0":
                print("Exiting...")
                exit(0)
            case "-":
                stackInterface()
            default:
                print("Invalid command.")
            }
        }
    }
}
