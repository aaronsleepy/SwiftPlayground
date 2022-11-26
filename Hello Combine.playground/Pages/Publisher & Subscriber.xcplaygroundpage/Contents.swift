import UIKit
import Combine

/**
 Publisher & Subscriber
*/
// Just -> sink
let just = Just(1000)
let subscription = just.sink { value in
    print("Received Value: \(value)")
}

let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received Value: \(value)")
}

// assign
class MyClass {
    var property: Int = 0 {
        didSet {
            print("Did set property to \(property)")
        }
    }
}

let object = MyClass()
let subscriptio = arrayPublisher.assign(to: \.property, on: object)
print("Final value: \(object.property)")
