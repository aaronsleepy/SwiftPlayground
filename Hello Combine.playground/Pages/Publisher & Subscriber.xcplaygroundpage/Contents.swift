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
