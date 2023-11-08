//
//  DoubleStack.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

struct DoubleStack<Element>: Stack {
    private var leftStack: ArrayStack<Element> = ArrayStack()
    private var rightStack: ArrayStack<Element> = ArrayStack()

    mutating func push(_ element: Element) {
        if !isFull() {
            rightStack.push(element)
        } else {
            print("Stack is full.")
        }
    }

    mutating func pop() -> Element? {
        if rightStack.isEmpty() {
            while !leftStack.isEmpty() {
                rightStack.push(leftStack.pop()!)
            }
        }
        return rightStack.pop()
    }

    func peek() -> Element? {
        if rightStack.isEmpty() {
            return leftStack.peek()
        }
        return rightStack.peek()
    }

    func isEmpty() -> Bool {
        return leftStack.isEmpty() && rightStack.isEmpty()
    }

    func isFull() -> Bool {
        return leftStack.isFull() || rightStack.isFull()
    }
}
