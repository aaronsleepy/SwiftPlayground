//: [Previous](@previous)

import Foundation
import Combine
import UIKit

/**
 URLSessionTask Publisher and JSON Decoding Operator
 */
struct SomeDecorable: Decodable {
    
}

URLSession.shared.dataTaskPublisher(for: URL(string: "https://kmong.com")!)
    .map { (data, response) in
        return data
    }
    .decode(type: SomeDecorable.self, decoder: JSONDecoder())

/**
 Notification
 */
let center = NotificationCenter.default
let notification = Notification.Name("My Notification")
let notificationPublisher = center.publisher(for: notification, object: nil)
let subscription = notificationPublisher.sink { _ in
    print(">>> Notification Received")
}
center.post(name: notification, object: nil)

/**
 KeyPath binding to NSObject instances
 */

let ageLabel = UILabel()
print(">>> text: \(ageLabel.text)")

Just(28)
    .map { "Age is \($0)"}
    .assign(to: \.text, on: ageLabel)
print(">>> text: \(ageLabel.text)")

/**
 Timer
 - autoconnect를 이용하면 subscribe 되면 바로 시작함
 */
let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    .autoconnect()
let subscription2 = timerPublisher.sink { time in
    print(">>> time: \(time)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}
