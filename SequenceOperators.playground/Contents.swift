import Combine
import Foundation

//min and max
func minMaxExample() {
  let publisher = [1, -35, 22, 40, 100].publisher
  
  publisher
    .min()
    .sink { print("Min: \($0)") }
  
  publisher
    .max()
    .sink { print("Max: \($0)") }
}

  //first and last
func firstLastExample() {
  let publisher = [1, -35, 22, 40, 100].publisher
  
  publisher
    .first()
    .sink { print("First: \($0)") }
  
  publisher
    .first(where: { $0 % 2 == 0 })
    .sink { print("First even num: \($0)") }
  
  publisher
    .last()
    .sink { print("Last: \($0)") }
}

//output
func outputExample() {
  let publisher = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].publisher
  
  publisher
    .output(at: 2) // works like arr[2]
    .sink { print("arr[2]: \($0)") }
  
  publisher
    .output(in: (3...5))
    .collect()
    .sink { print("arr[3...5]: \($0)") }
}

//count
func countExample() {
  let publisher = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].publisher
  let publisher1 = PassthroughSubject<Int, Never>()
  
  publisher
    .count()
    .sink { print("publisher's array count: \($0)") }
  
  publisher1
    .count()
    .sink { print("publisher1's array count: \($0)") }
  
  publisher1.send(10)
  publisher1.send(14)
  publisher1.send(22)
  publisher1.send(completion: .finished)
}

// contains
func containsExample() {
  let numbers = [-1, 5, 10, 5]
  numbers.publisher
    .contains(5)
    .sink { print("\($0)") }
}

//allSatisfy
func allSatisfyExample() {
  let nums = [12, 2, 4, 8, 100]
  nums.publisher
    .allSatisfy{ $0 % 2 == 0 }
    .sink{ allEven in
      print("Are they all even? : \(allEven)")
    }
}

//reduce
func reduceExample() {
  let nums = [1, 2, 3, 4, 5, 6]
  
  nums.publisher
    .reduce(0) { accumulator, nextValue in
      return accumulator + nextValue
    }
    .sink { print($0) }
}
reduceExample()
