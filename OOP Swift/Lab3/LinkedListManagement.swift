//
//  LinkedListImpementation.swift
//  Lab0 Swift
//
//  Created by Mindrescu Dragomir on 20.11.2023.
//

import Foundation

class LinkedListNode<Element> {
    var value: Element
    var next: LinkedListNode?

    init(value: Element) {
        self.value = value
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
