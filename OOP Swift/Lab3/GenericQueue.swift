//
//  GenericQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func genericQueue() {
    var genericQueue = ArrayQueue<Any>(capacity: 5)

    while true {
        print("Enter 'enqueue', 'dequeue', or 'exit':")
        if let action = readLine() {
            switch action {
            case "enqueue":
                print("Enter something to enqueue:")
                if let value = readLine() {
                    genericQueue.enqueue(value)
                    print("Enqueued '\(value)'")
                }
            case "dequeue":
                if let dequeued = genericQueue.dequeue() {
                    print("Dequeued: \(dequeued)")
                } else {
                    print("Queue is empty.")
                }
            case "print":
                print("Queue elements: \(genericQueue.elements())")
            case "exit":
                print("Exiting...")
                break
            default:
                print("Invalid command.")
            }
        }
    }

}