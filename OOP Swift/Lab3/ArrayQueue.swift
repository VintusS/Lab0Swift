//
//  ArrayQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

class ArrayQueue<Element> {
    private var storage: [Element?]
    private var front: Int
    private var rear: Int
    private let capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
        storage = Array(repeating: nil, count: capacity)
        front = 0
        rear = -1
    }

    func enqueue(_ element: Element) {
        guard !isFull() else {
            print("Queue is full.")
            return
        }
        rear = (rear + 1) % capacity
        storage[rear] = element
    }

    func dequeue() -> Element? {
        guard !isEmpty() else {
            print("Queue is empty.")
            return nil
        }
        let element = storage[front]
        storage[front] = nil
        front = (front + 1) % capacity
        return element
    }

    func peek() -> Element? {
        guard !isEmpty() else {
            return nil
        }
        return storage[front]
    }

    func isEmpty() -> Bool {
        return front == (rear + 1) % capacity
    }

    func isFull() -> Bool {
        return (rear + 2) % capacity == front
    }

    func size() -> Int {
        if rear >= front {
            return rear - front + 1
        } else {
            return rear + 1 + capacity - front
        }
    }
    func elements() -> [Element?] {
        return storage
    }
}
