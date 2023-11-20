//
//  StackImplementation.swift
//  Lab0 Swift
//
//  Created by Mindrescu Dragomir on 20.11.2023.
//

import Foundation

func stackMenu() {
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
            interactWithStack(ArrayUpStack<Int>())
        case "2":
            interactWithStack(ArrayDownStack<Int>())
        case "3":
            interactWithLinkedListStack()
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

func interactWithStack<T: Stack>(_ stack: T) where T.Element == Int {
    var stack = stack
    var shouldContinue = true
    while shouldContinue {
        print("Choose action:")
        print("[1] - Push")
        print("[2] - Pop")
        print("[3] - Peek")
        print("[4] - Print")
        print()
        print("[b] - Back")
        print("[0] - Exit")
        print()
        print("your input> ", terminator: "")
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter a number to push:")
                if let numberString = readLine(), let number = Int(numberString) {
                    stack.push(number)
                }
            case "2":
                print("Popped: \(stack.pop() ?? -1)")
            case "3":
                print("Peek: \(stack.peek() ?? -1)")
            case "4":
                stack.printStack()
            case "b":
                stackMenu()
            case "0":
                shouldContinue = false
            default:
                print("Invalid action")
            }
        }
    }
}

func interactWithLinkedListStack() {
    var stack = LinkedListStack<Int>()
    var shouldContinue = true

    while shouldContinue {
        print("Choose action:")
        print("[1] - Push")
        print("[2] - Pop")
        print("[3] - Peek")
        print("[4] - Print")
        print()
        print("[b] - Back")
        print("[0] - Exit")
        print()
        print("your input> ", terminator: "")
        if let action = readLine() {
            switch action {
            case "1":
                print("Enter a number to push:")
                if let numberString = readLine(), let number = Int(numberString) {
                    stack.push(number)
                } else {
                    print("Invalid input. Please enter a number.")
                }
            case "2":
                if let poppedValue = stack.pop() {
                    print("Popped: \(poppedValue)")
                } else {
                    print("Stack is empty.")
                }
            case "3":
                if let peekValue = stack.peek() {
                    print("Top element: \(peekValue)")
                } else {
                    print("Stack is empty.")
                }
            case "4":
                stack.printStack()
            case "b":
                mainMenu()
            case "0":
                shouldContinue = false
            default:
                print("Invalid action. Please choose a number between 0 and 4.")
            }
        }
    }
}
