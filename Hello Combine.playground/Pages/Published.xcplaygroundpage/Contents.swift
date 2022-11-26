//: [Previous](@previous)

import Foundation
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = "Empty"
}

let label = Label()
let viewModel = SomeViewModel()

print(">>> text: \(label.text)")
    
viewModel.$name.assign(to: \.text, on: label)
print(">>> text: \(label.text)")

viewModel.name = "Aaron"
print(">>> text: \(label.text)")
