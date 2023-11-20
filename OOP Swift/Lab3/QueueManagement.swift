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
        array.append(element)
    }

    mutating func dequeue() -> Element? {
        return array.isEmpty ? nil : array.removeFirst()
    }

    func printQueue() {
        print(array)
    }
}

struct ArrayDownQueue<Element>: Queue {
    private var array = [Element]()

    mutating func enqueue(_ element: Element) {
        array.insert(element, at: 0)
    }

    mutating func dequeue() -> Element? {
        return array.popLast()
    }

    func printQueue() {
        print(array)
    }
}
