import UIKit
import Combine


guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { fatalError("Invalid URL") }

let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print().share()

let subscriber1 = request.sink { _ in } receiveValue: { print($0) }

let subscriber2 = request.sink { _ in } receiveValue: { print($0) }
