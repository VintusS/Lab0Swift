//
//  LinkedListQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

struct LinkedListQueue<Element>: Queue {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private var queueSize: Int = 0
    private let capacity: Int = 5

    mutating func enqueue(_ element: Element) {
        if !isFull() {
            let newNode = Node(value: element)
            if let tailNode = tail {
                tailNode.next = newNode
            } else {
                head = newNode
            }
            tail = newNode
            queueSize += 1
        } else {
            print("Queue is full.")
        }
    }

    mutating func dequeue() -> Element? {
        if let headNode = head {
            head = headNode.next
            if head == nil {
                tail = nil
            }
            queueSize -= 1
            return headNode.value
        }
        return nil
    }

    func front() -> Element? {
        return head?.value
    }

    func isEmpty() -> Bool {
        return head == nil
    }

    func isFull() -> Bool {
        return queueSize >= capacity
    }
}
