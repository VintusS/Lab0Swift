//
//  ArrayQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

struct ArrayQueue<Element>: Queue {
    private var storage: [Element?] = Array(repeating: nil, count: 5)
    private var head: Int = 0
    private var tail: Int = 0

    mutating func enqueue(_ element: Element) {
        if !isFull() {
            storage[tail % capacity] = element
            tail += 1
        } else {
            print("Queue is full.")
        }
    }

    mutating func dequeue() -> Element? {
        if !isEmpty() {
            let element = storage[head % capacity]
            storage[head % capacity] = nil
            head += 1
            return element
        }
        return nil
    }

    func front() -> Element? {
        return storage[head % capacity]
    }

    func isEmpty() -> Bool {
        return head == tail
    }

    func isFull() -> Bool {
        return tail - head == capacity
    }

    private var capacity: Int {
        return storage.count
    }
}
