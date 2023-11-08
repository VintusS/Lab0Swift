//
//  ArrayStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

struct ArrayStack<Element>: Stack {
    private var storage: [Element] = []
    private let capacity: Int = 5

    mutating func push(_ element: Element) {
        if !isFull() {
            storage.append(element)
        } else {
            print("Stack is full.")
        }
    }

    mutating func pop() -> Element? {
        return storage.popLast()
    }

    func peek() -> Element? {
        return storage.last
    }

    func isEmpty() -> Bool {
        return storage.isEmpty
    }

    func isFull() -> Bool {
        return storage.count >= capacity
    }
}
