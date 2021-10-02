import Combine
import Foundation
import PlaygroundSupport
import SwiftUI

func collectExample() {
  let numbers = (0...10)
  let cancellable = numbers.publisher
    .collect(4)
    .sink { print($0) }
  cancellable.cancel()
}

  // map()
func mapExample() {
  let formatter = NumberFormatter()
  formatter.numberStyle = .spellOut
  
  let numbers = [123, 55, 83, 42]
  let cancellable = numbers.publisher
    .map {
      formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink {
      print($0)
    }
  cancellable.cancel()
}


  // map(_:)
struct Point {
  let x: Int
  let y: Int
}
func mapKeyPath() {
  let publisher = PassthroughSubject<Point, Never>()
  publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x) and y is \(y)")
  }
  publisher.send(Point(x: 2, y: 5))
}

//flatMap()



// replaceNil
func replaceNilExample() {
  let data = ["A", "B", nil, "C", nil, "D"]
  let cancellable = data.publisher
  cancellable
    .replaceNil(with: "*")
    .sink { print($0!) }
}



// scan
func scanExample() {
  let publisher = (1...10).publisher
  publisher.scan([]) { numbers, value -> [Int] in
    numbers + [value]
  }
  .sink {
    print($0)
  }
}
scanExample()
