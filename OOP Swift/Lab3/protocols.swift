//
//  protocols.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

protocol Stack {
    associatedtype Element
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
    func isEmpty() -> Bool
    func isFull() -> Bool
}

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    func front() -> Element?
    func isEmpty() -> Bool
    func isFull() -> Bool
}
