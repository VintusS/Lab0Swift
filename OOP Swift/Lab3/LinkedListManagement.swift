//
//  LinkedListImpementation.swift
//  Lab0 Swift
//
//  Created by Mindrescu Dragomir on 20.11.2023.
//

import Foundation

class LinkedListNode<Element> {
    var value: Element
    var next: LinkedListNode?

    init(value: Element) {
        self.value = value
    }
}
