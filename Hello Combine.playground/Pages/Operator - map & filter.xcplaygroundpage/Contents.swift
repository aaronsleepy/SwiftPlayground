//: [Previous](@previous)

import Foundation
import Combine

/**
 Transform - Map
 */
let numPublisher = PassthroughSubject<Int, Never>()
let subscription = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print(">>> Transformed Value: \(value)")
    }

numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription.cancel()

/**
 Fllter
 */
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print(">>> Filtered Value: \(value)")
    }

stringPublisher.send("aaron")
stringPublisher.send("jack")
stringPublisher.send("jenny")
stringPublisher.send("john")
subscription2.cancel()
