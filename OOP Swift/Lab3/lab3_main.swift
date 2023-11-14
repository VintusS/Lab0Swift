//
//  lab3_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

func lab3() {
    mainInterface()
}

func mainInterface() {
    print("Welcome to Queue/Stack manipulation system!")
    print("Choose an data structure:")
    print("1.Stack")
    print("2.Queue")
    print()
    print("0.Exit")
    print("your input> ", terminator: "")
    if let structure = readLine() {
        switch structure {
        case "1":
            stackInterface()
        case "2":
            queueInterface()
        case "0":
            print("Exiting...")
            exit(0)
        default:
            print("Command not found")
            mainInterface()
        }
    }
}

func stackInterface() {
    print("Choose an system to review")
    print("1.String Stack")
    print("2.Integer Stack")
    print("3.Generic Stack")
    print()
    print("0.Exit")
    print("-.Back")
    print("your input> ", terminator: "")
    if let choice = readLine() {
        switch choice {
        case "1":
            stringStack()
        case "2":
            integerStack()
        case "3":
            genericStack()
        case "0":
            print("Exiting...")
            exit(0)
        case "-":
            mainInterface()
        default:
            print("Command not found :(")
            print()
            mainInterface()
        }
    }
}

func queueInterface() {
    print("Choose an system to review")
    print("1.String Queue")
    print("2.Integer Queue")
    print("3.Generic Queue")
    print("0.Exit")
    print("-.Back")
    print("your input> ", terminator: "")
    if let choice = readLine() {
        switch choice {
        case "1":
            stringQueue()
        case "2":
            integerQueue()
        case "3":
            genericQueue()
        case "0":
            print("Exiting...")
            exit(0)
        case "-":
            mainInterface()
        default:
            print("Command not found :(")
            print()
            mainInterface()
        }
    }
}
