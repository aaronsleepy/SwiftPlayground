//: [Previous](@previous)

import Foundation
import Combine

/**
 2개의 Publisher로부터 동시에 받아서 합치고 싶을 때
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
// Ex: username과 password가 입력될 때 동시에 validation check 하기
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validateCredentialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print(">>> Credential valid?: \(valid)")
    }

usernamePublisher.send("jasonlee")
passwordPublisher.send("")
passwordPublisher.send("weak")
passwordPublisher.send("1234567890123")


// Merge: Output 타입이 같은 경우
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

let mergedPublisherSusbscription = publisher1.merge(with: publisher2)
    .sink { value in
        print(">>> Merge: sugscription received value: \(value)")
    }
