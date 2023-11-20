//
//  lab3_main.swift
//  Lab0 Swift
//
//  Created by Dragosh on 07.11.2023.
//

import Foundation

func lab3() {
    mainMenu()
}

func mainMenu() {
    print("Choose data structure:")
    print("[1] - Stack")
    print("[2] - Queue")
    print()
    print("[0] - Exit")
    print()
    print("your input> ", terminator: "")
    if let choice = readLine() {
        switch choice {
        case "1":
            stackMenu()
        case "2":
            queueMenu()
        case "0":
            print("Exiting...")
            exit(0)
        default:
            print("Invalid choice")
        }
    }
}
