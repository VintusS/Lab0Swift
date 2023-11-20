//
//  StackManagement.swift
//  Lab0 Swift
//
//  Created by Mindrescu Dragomir on 20.11.2023.
//

import Foundation

protocol Stack {
    associatedtype Element
    mutating func push(_ item: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
    func printStack()
}

struct ArrayUpStack<Element>: Stack {
    private var array = [Element]()

    mutating func push(_ item: Element) {
        array.append(item)
    }

    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }

    func printStack() {
        print(array)
    }
}

struct ArrayDownStack<Element>: Stack {
    private var array = [Element]()

    mutating func push(_ item: Element) {
        array.insert(item, at: 0)
    }

    mutating func pop() -> Element? {
        return array.isEmpty ? nil : array.removeFirst()
    }

    func peek() -> Element? {
        return array.first
    }

    func printStack() {
        print(array)
    }
}
