//
//  IntegerQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func integerQueue() {
    let intQueue = ArrayQueue<Int>(capacity: 5)

    while true {
        print("Enter your command(enqueue, dequeue, print or exit):")
        if let action = readLine() {
            switch action {
            case "enqueue":
                print("Enter an integer to enqueue:")
                if let value = readLine(), let intValue = Int(value) {
                    intQueue.enqueue(intValue)
                    print("Enqueued \(intValue)")
                } else {
                    print("Invalid integer.")
                }
            case "dequeue":
                if let dequeued = intQueue.dequeue() {
                    print("Dequeued: \(dequeued)")
                } else {
                    print("Queue is empty.")
                }
            case "print":
                print("Queue elements: \(intQueue.elements())")
            case "exit":
                print("Exiting...")
                interface()
            default:
                print("Invalid command.")
            }
        }
    }

}
