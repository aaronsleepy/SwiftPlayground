//: [Previous](@previous)

import Foundation
import Combine

/**
 2개의 Publisher로부터 동시에 받고 싶을 때
 */

// Basic CombineLatest
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

// |--> time
// 1: "a",            "b",    "c"
// 2:     1      2     3            4
// r:    a:1    a:2   b:3     c:3  c:4

strPublisher.combineLatest(numPublisher).sink { (str, num) in
    print("Receive: \(str):\(num)")
}

strPublisher.send("a")
numPublisher.send(1)
numPublisher.send(2)
strPublisher.send("b")
numPublisher.send(3)
strPublisher.send("c")
numPublisher.send(4)


// Advanced CombineLatest


// Merge


