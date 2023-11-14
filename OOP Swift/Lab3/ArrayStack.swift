//
//  ArrayStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

class ArrayStack<Element> {
    private var storage: [Element]
    private let capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
        storage = []
    }

    func push(_ element: Element) {
        guard !isFull() else { return }
        storage.append(element)
    }

    func pop() -> Element? {
        storage.popLast()
    }

    func peek() -> Element? {
            return storage.last
        }

        func isEmpty() -> Bool {
            return storage.isEmpty
        }

        func isFull() -> Bool {
            return storage.count == capacity
        }

        func size() -> Int {
            return storage.count
        }
    func elements() -> [Element] {
        return storage
    }
}

func stackManSys<T>(stack: ArrayStack<T>) {
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
                print("Enter a string to push:")
                if let value = readLine() {
                    if let convertedValue = convertToStackType(value, T.self) {
                        stack.push(convertedValue)
                        print("Pushed '\(convertedValue)'")
                    } else {
                        print("Invalid input for type \(T.self).")
                    }
                }
            case "2":
                if let popped = stack.pop() {
                    print("Popped: \(popped)")
                } else {
                    print("Stack is empty.")
                }
            case "3":
                if let topElement = stack.peek() {
                    print("Top element: \(topElement)")
                } else {
                    print("Stack is empty.")
                }
            case "4":
                print("Stack is empty: \(stack.isEmpty())")
            case "5":
                print("Stack is full: \(stack.isFull())")
            case "6":
                print("Stack size: \(stack.size())")
            case "7":
                print("Stack elements: \(stack.elements())")
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

func convertToStackType<T>(_ value: String, _ type: T.Type) -> T? {
    if type == Int.self, let intValue = Int(value) {
        return intValue as? T
    } else if type == Double.self, let doubleValue = Double(value) {
        return doubleValue as? T
    } else if type == String.self {
        return value as? T
    }
    return nil
}
