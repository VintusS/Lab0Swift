//
//  QueueImplementation.swift
//  Lab0 Swift
//
//  Created by Mindrescu Dragomir on 20.11.2023.
//

import Foundation

func queueMenu() {
    print("Choose implementation:")
    print("[1] - ArrayUp")
    print("[2] - ArrayDown")
    print("[3] - LinkedList")
    print()
    print("[b] - Back")
    print("[0] - Exit")
    print()
    print("your input> ", terminator: "")
    if let choice = readLine() {
        switch choice {
        case "1":
            interactWithQueue(ArrayUpQueue<Int>())
        case "2":
            interactWithQueue(ArrayDownQueue<Int>())
        case "3":
            interactWithLinkedListQueue()
        case "b":
            mainMenu()
        case "0":
            print("Exiting...")
            exit(0)
        default:
            print("Invalid choice")
        }
    }
}

func interactWithQueue<T: Queue>(_ queue: T) where T.Element == Int {
    var queue = queue
    var shouldContinue = true
    while shouldContinue {
        print("Choose action:")
        print("[1] - Enqueue")
        print("[2] - Dequeue")
        print("[3] - Print")
        print()
        print("[b] - Back")
        print("[0] - Exit")
        print()
        print("your input> ", terminator: "")
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter a number to enqueue:")
                if let numberString = readLine(), let number = Int(numberString) {
                    queue.enqueue(number)
                }
            case "2":
                print("Dequeued: \(queue.dequeue() ?? -1)")
            case "3":
                queue.printQueue()
            case "b":
                queueMenu()
            case "0":
                shouldContinue = false
            default:
                print("Invalid action")
            }
        }
    }
}

func interactWithLinkedListQueue() {
    var queue = LinkedListQueue<Int>()
    var shouldContinue = true

    while shouldContinue {
        print("Choose action:")
        print("[1] - Enqueue")
        print("[2] - Dequeue")
        print("[3] - Print")
        print()
        print("[b] - Back")
        print("[0] - Exit")
        print()
        print("your input> ", terminator: "")
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter a number to enqueue:")
                if let numberString = readLine(), let number = Int(numberString) {
                    queue.enqueue(number)
                } else {
                    print("Invalid input. Please enter a number.")
                }
            case "2":
                if let dequeuedValue = queue.dequeue() {
                    print("Dequeued: \(dequeuedValue)")
                } else {
                    print("Queue is empty.")
                }
            case "3":
                queue.printQueue()
            case "b":
                queueMenu()
            case "0":
                shouldContinue = false
            default:
                print("Invalid action. Please choose a number between 0 and 3.")
            }
        }
    }
}
