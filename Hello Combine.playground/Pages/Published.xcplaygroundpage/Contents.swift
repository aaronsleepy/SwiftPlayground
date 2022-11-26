//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()


let subscription = subject
    .print()
    .sink { value in
    print(">>> Subscriber received value: \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")
subject.send(completion: .finished) // <-- Publisher가 종료 이벤트 전송
//subscription.cancel() // Subscriber가 종료 요청
subject.send("Hello ?? :(")
