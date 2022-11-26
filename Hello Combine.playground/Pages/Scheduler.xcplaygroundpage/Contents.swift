//: [Previous](@previous)

import Foundation
import Combine


let arrayPublisher = [1, 2, 3].publisher

let queue = DispatchQueue(label: "customQueue")

let subscription = arrayPublisher
    .map { value -> Int in
        print(">>> transform: \(value), thread: \(Thread.current)")
        return value
    }
    .sink { value in
    print(">>> Received Value: \(value), thread: \(Thread.current)")
}


// map 태스크가 heavy하다면, 별도의 Thread에서 실행
let subscription2 = arrayPublisher
    .subscribe(on: queue)
    .map { value -> Int in
        print(">>> transform: \(value), thread: \(Thread.current)")
        return value
    }
    .receive(on: DispatchQueue.main)
    .sink { value in
    print(">>> Received Value: \(value), thread: \(Thread.current)")
}
