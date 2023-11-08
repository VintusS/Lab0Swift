//
//  LinkedListStack.swift
//  
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

class Node<Element> {
    var value: Element
    var next: Node?

    init(value: Element) {
        self.value = value
    }
}

struct LinkedListStack<Element>: Stack {
    private var head: Node<Element>?
    private var stackSize: Int = 0
    private let capacity: Int = 5

    mutating func push(_ element: Element) {
        if !isFull() {
            let newNode = Node(value: element)
            newNode.next = head
            head = newNode
            stackSize += 1
        } else {
            print("Stack is full.")
        }
    }

    mutating func pop() -> Element? {
        if let node = head {
            head = node.next
            stackSize -= 1
            return node.value
        }
        return nil
    }

    func peek() -> Element? {
        return head?.value
    }

    func isEmpty() -> Bool {
        return head == nil
    }

    func isFull() -> Bool {
        return stackSize >= capacity
    }
}
