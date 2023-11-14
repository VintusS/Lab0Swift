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
                print("Enter an integer to enqueue:")
                if let value = readLine(), let intValue = Int(value) {
                    intQueue.enqueue(intValue)
                    print("Enqueued \(intValue)")
                } else {
                    print("Invalid integer.")
                }
            case "2":
                if let dequeued = intQueue.dequeue() {
                    print("Dequeued: \(dequeued)")
                } else {
                    print("Queue is empty.")
                }
            case "3":
                if let frontElement = intQueue.peek() {
                    print("Front element: \(frontElement)")
                } else {
                    print("Queue is empty.")
                }
            case "4":
                print("Queue is empty: \(intQueue.isEmpty())")
            case "5":
                print("Queue is full: \(intQueue.isFull())")
            case "6":
                print("Queue size: \(intQueue.size())")
            case "7":
                print("Queue elements: \(intQueue.elements())")
            case "0":
                print("Exiting...")
                interface()
            default:
                print("Invalid command.")
            }
        }
    }

}
