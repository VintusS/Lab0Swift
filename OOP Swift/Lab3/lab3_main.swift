//
//  lab3_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

func lab3() {
    // MARK: - Stack
    var arrayStack = ArrayStack<Int>()
    arrayStack.push(10)
    arrayStack.push(20)
    print(arrayStack.pop() ?? "ArrayStack is empty") // Should print 20
    print(arrayStack.peek() ?? "ArrayStack is empty") // Should print 10
    
    var linkedListStack = LinkedListStack<Int>()
    linkedListStack.push(30)
    linkedListStack.push(40)
    print(linkedListStack.pop() ?? "LinkedListStack is empty") // Should print 40
    print(linkedListStack.peek() ?? "LinkedListStack is empty") // Should print 30

    var doubleStack = DoubleStack<String>()
    doubleStack.push("Hello")
    doubleStack.push("World")
    print(doubleStack.pop() ?? "DoubleStack is empty") // Should print "World"
    print(doubleStack.peek() ?? "DoubleStack is empty") // Should print "Hello"

    // MARK: - Queue
    
    var arrayQueue = ArrayQueue<String>()
    arrayQueue.enqueue("First")
    arrayQueue.enqueue("Second")
    print(arrayQueue.dequeue() ?? "ArrayQueue is empty") // Should print "First"
    print(arrayQueue.front() ?? "ArrayQueue is empty") // Should print "Second"

    var linkedListQueue = LinkedListQueue<Int>()
    linkedListQueue.enqueue(50)
    linkedListQueue.enqueue(60)
    print(linkedListQueue.dequeue() ?? "LinkedListQueue is empty") // Should print 50
    print(linkedListQueue.front() ?? "LinkedListQueue is empty") // Should print 60

    var ringBufferQueue = RingBufferQueue<Character>()
    ringBufferQueue.enqueue("A")
    ringBufferQueue.enqueue("B")
    print(ringBufferQueue.dequeue() ?? "RingBufferQueue is empty") // Should print "A"
    print(ringBufferQueue.front() ?? "RingBufferQueue is empty") // Should print "B"


}
