//
//  StringQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

func stringQueue() {
    let stringQueue = ArrayQueue<String>(capacity: 5)

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
        print("0.Exit")
        print("-.Back")
        print()
        print("your input> ", terminator: "")
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter a string to enqueue:")
                if let value = readLine() {
                    stringQueue.enqueue(value)
                    print("Enqueued '\(value)'")
                }
            case "2":
                if let dequeued = stringQueue.dequeue() {
                    print("Dequeued: \(dequeued)")
                } else {
                    print("Queue is empty.")
                }
            case "3":
                if let frontElement = stringQueue.peek() {
                    print("Front element: \(frontElement)")
                } else {
                    print("Queue is empty.")
                }
            case "4":
                print("Queue is empty: \(stringQueue.isEmpty())")
            case "5":
                print("Queue is full: \(stringQueue.isFull())")
            case "6":
                print("Queue size: \(stringQueue.size())")
            case "7":
                print("Queue elements: \(stringQueue.elements())")
            case "0":
                print("Exiting...")
                exit(0)
            case "-":
                queueInterface()
            default:
                print("Invalid command.")
            }
        }
    }

}
