//
//  QueueImplementation.swift
//  Lab0 Swift
//
//  Created by Mindrescu Dragomir on 20.11.2023.
//

import Foundation

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    func printQueue()
}

struct ArrayUpQueue<Element>: Queue {
    private var array = [Element]()

    mutating func enqueue(_ element: Element) {
        array += [element]
    }

    mutating func dequeue() -> Element? {
        guard !array.isEmpty else { return nil }
        return array.remove(at: 0)
    }

    func printQueue() {
        print(array)
    }
}

struct ArrayDownQueue<Element>: Queue {
    private var array = [Element]()

    mutating func enqueue(_ element: Element) {
        array = [element] + array
    }

    mutating func dequeue() -> Element? {
        guard !array.isEmpty else { return nil }
        return array.remove(at: array.count - 1)
    }

    func printQueue() {
        print(array)
    }
}

struct LinkedListQueue<Element>: Queue {
    private var head: LinkedListNode<Element>?
    private var tail: LinkedListNode<Element>?

    mutating func enqueue(_ element: Element) {
        let newNode = LinkedListNode(value: element)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    mutating func dequeue() -> Element? {
        let value = head?.value
        head = head?.next
        if head == nil {
            tail = nil
        }
        return value
    }

    func printQueue() {
        var currentNode = head
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
        print()
    }
}
