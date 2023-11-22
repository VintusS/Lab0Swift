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
        array += [item]
    }

    mutating func pop() -> Element? {
        guard !array.isEmpty else { return nil }
        return array.remove(at: array.count - 1)
    }

    func peek() -> Element? {
        guard !array.isEmpty else { return nil }
        return array[array.count - 1]
    }

    func printStack() {
        print(array)
    }
}

struct ArrayDownStack<Element>: Stack {
    private var array = [Element]()

    mutating func push(_ item: Element) {
        array = [item] + array
    }

    mutating func pop() -> Element? {
        guard !array.isEmpty else { return nil }
        return array.remove(at: 0)
    }

    func peek() -> Element? {
        guard !array.isEmpty else { return nil }
        return array[0]
    }

    func printStack() {
        print(array)
    }
}
