//
//  ArrayQueue.swift
//  Lab0 Swift
//
//  Created by Dragosh on 14.11.2023.
//

import Foundation

class ArrayQueue<Element> {
    private var storage: [Element?]
    private var front: Int
    private var rear: Int
    private let capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
        storage = Array(repeating: nil, count: capacity)
        front = 0
        rear = -1
    }

    func enqueue(_ element: Element) {
        guard !isFull() else {
            print("Queue is full.")
            return
        }
        rear = (rear + 1) % capacity
        storage[rear] = element
    }

    func dequeue() -> Element? {
        guard !isEmpty() else {
            print("Queue is empty.")
            return nil
        }
        let element = storage[front]
        storage[front] = nil
        front = (front + 1) % capacity
        return element
    }

    func peek() -> Element? {
            guard !isEmpty() else {
                return nil
            }
            return storage[front]
        }

        func isEmpty() -> Bool {
            return front == (rear + 1) % capacity
        }

        func isFull() -> Bool {
            return (rear + 2) % capacity == front
        }

        func size() -> Int {
            if rear >= front {
                return rear - front + 1
            } else {
                return rear + 1 + capacity - front
            }
        }
    func elements() -> [Element] {
        return storage.compactMap { $0 }
    }
}


func queueManSys<T>(queue: ArrayQueue<T>){
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
                print("Enter an element to enqueue:")
                if let value = readLine() {
                    if let convertedValue = convertToQueueType(value, T.self) {
                        queue.enqueue(convertedValue)
                        print("Enqueued \(convertedValue)")
                    } else {
                        print("Invalid input for type \(T.self).")
                    }
                }
            case "2":
                if let dequeued = queue.dequeue() {
                    print("Dequeued: \(dequeued)")
                } else {
                    print("Queue is empty.")
                }
            case "3":
                if let frontElement = queue.peek() {
                    print("Front element: \(frontElement)")
                } else {
                    print("Queue is empty.")
                }
            case "4":
                print("Queue is empty: \(queue.isEmpty())")
            case "5":
                print("Queue is full: \(queue.isFull())")
            case "6":
                print("Queue size: \(queue.size())")
            case "7":
                print("Queue elements: \(queue.elements())")
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

func convertToQueueType<T>(_ value: String, _ type: T.Type) -> T? {
    if type == Int.self, let intValue = Int(value) {
        return intValue as? T
    } else if type == Double.self, let doubleValue = Double(value) {
        return doubleValue as? T
    } else if type == String.self {
        return value as? T
    }
    return nil
}
