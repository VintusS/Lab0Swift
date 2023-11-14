//
//  GenericQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func genericQueue() {
    let genericQueue = ArrayQueue<Any>(capacity: 5)

    while true {
        print("Enter your command:")
        print("1.enqueue")
        print("2.dequeue")
        print("3.peek")
        print("4.isEmpty?")
        print("5.isFull?")
        print("6.size")
        print("7.print")
        print()
        print("0.exit")
        print()
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter something to enqueue:")
                if let value = readLine() {
                    genericQueue.enqueue(value)
                    print("Enqueued '\(value)'")
                }
            case "2":
                if let dequeued = genericQueue.dequeue() {
                    print("Dequeued: \(dequeued)")
                } else {
                    print("Queue is empty.")
                }
            case "3":
                if let frontElement = genericQueue.peek() {
                    print("Front element: \(frontElement)")
                } else {
                    print("Queue is empty.")
                }
            case "4":
                print("Queue is empty: \(genericQueue.isEmpty())")
            case "5":
                print("Queue is full: \(genericQueue.isFull())")
            case "6":
                print("Queue size: \(genericQueue.size())")
            case "7":
                print("Queue elements: \(genericQueue.elements())")
            case "0":
                print("Exiting...")
                interface()
            default:
                print("Invalid command.")
            }
        }
    }

}
