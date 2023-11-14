//
//  IntegerStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func integerStack() {
    let intStack = ArrayStack<Int>(capacity: 5)
    
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
        print("0.exit")
        print()
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter an integer to push:")
                if let value = readLine(), let intValue = Int(value) {
                    intStack.push(intValue)
                    print("Pushed \(intValue)")
                } else {
                    print("Invalid integer.")
                }
            case "2":
                if let popped = intStack.pop() {
                    print("Popped: \(popped)")
                } else {
                    print("Stack is empty.")
                }
            case "3":
                if let topElement = intStack.peek() {
                    print("Top element: \(topElement)")
                } else {
                    print("Stack is empty.")
                }
            case "4":
                print("Stack is empty: \(intStack.isEmpty())")
            case "5":
                print("Stack is full: \(intStack.isFull())")
            case "6":
                print("Stack size: \(intStack.size())")
            case "7":
                print("Stack elements: \(intStack.elements())")
            case "0":
                print("Exiting...")
                interface()
            default:
                print("Invalid command.")
            }
        }
    }
}
