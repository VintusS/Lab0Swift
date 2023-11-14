//
//  lab3_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

func lab3() {
    interface()
}

func interface() {
    print("Welcome to Queue/Stack manipulation system!")
    print("Choose an operation:")
    print("1.String Stack")
    print("2.Integer Stack")
    print("3.Generic Stack")
    print("4.String Queue")
    print("5.Integer Queue")
    print("6.Generic Queue")
    print()
    print("0.Exit")
    print()
    print("your input> ", terminator: "")
    if let input = readLine() {
        switch input {
        case "1":
            stringStack()
        case "2":
            integerStack()
        case "3":
            genericStack()
        case "4":
            stringQueue()
        case "5":
            integerQueue()
        case "6":
            genericQueue()
        case "0":
            exit(0)
        default:
            print("Command not found :(")
            print()
            interface()
        }
    }
}
