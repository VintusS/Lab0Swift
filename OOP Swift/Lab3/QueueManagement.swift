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
