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
