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

struct LinkedListStack<Element>: Stack {
    private var head: LinkedListNode<Element>?
    
    mutating func push(_ item: Element) {
        let newNode = LinkedListNode(value: item)
        newNode.next = head
        head = newNode
    }
    
    mutating func pop() -> Element? {
        let value = head?.value
        head = head?.next
        return value
    }
    
    func peek() -> Element? {
        return head?.value
    }
    
    func printStack() {
        var currentNode = head
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
        print()
    }
}
