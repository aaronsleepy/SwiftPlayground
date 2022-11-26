//: [Previous](@previous)

import Foundation
import Combine

/**
 PassthroughSubject
 */
let relay = PassthroughSubject<String, Never>()
relay.send("Initial text")
let subscription1 = relay.sink { value in
    print("subscription1 received value: \(value)")
}

relay.send("Hello")
relay.send("World")
relay.values


/**
 CurrentValueSubject
 */
let variable = CurrentValueSubject<String, Never>("")
variable.send("Initial text")

let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}

variable.send("More text")
variable.send("And more text")

variable.value



// 이건?
let publisher = ["Hello", "we", "go"].publisher
publisher.subscribe(relay)
publisher.subscribe(variable)
